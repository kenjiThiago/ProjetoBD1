from flask import Blueprint, jsonify, request
from Database.classe_vaga import Vaga
from Database.classe_curso import Curso
from Database.classe_aluno import Aluno

cursos_necessarios_blueprint = Blueprint("rota_cursos_necessarios", __name__)

@cursos_necessarios_blueprint.route("/cursos_necessarios", methods=["GET"])
def get_cursos_necessarios():
    email_aluno = request.args.get("email_aluno", "").strip()
    id_vaga = request.args.get("id_vaga", "").strip()

    if not email_aluno or not id_vaga:
        return jsonify({"error": "Parâmetros 'email_aluno' e 'id_vaga' são obrigatórios"}), 400

    vaga_model = Vaga()
    curso_model = Curso()
    aluno_model = Aluno()

    vaga = vaga_model.get_vagas(id=int(id_vaga))
    if not vaga:
        return jsonify({"error": "Vaga não encontrada"}), 404

    vaga = vaga[0]  

    query_habilidades_faltantes = f"""
    SELECT DISTINCT hv.habilidade
    FROM habilidade_vaga hv
    LEFT JOIN habilidade_curso hc 
    ON hv.habilidade = hc.habilidade
    LEFT JOIN estuda e 
    ON e.nome_curso = hc.nome_curso
    WHERE hv.id_vaga = {id_vaga}
    AND (hc.nome_curso IS NULL OR e.email_aluno != '{email_aluno}')
    """
    habilidades_faltantes = vaga_model.db.execute_select_all(query_habilidades_faltantes)

    if not habilidades_faltantes:
        return jsonify({
            "vaga": {"id": vaga["id"], "nome": vaga["vaga_nome"]},
            "habilidades_faltantes": [],
            "cursos_sugeridos": []
        }), 200

    habilidades_faltantes = [h["habilidade"] for h in habilidades_faltantes]

    habilidades_str = "', '".join(habilidades_faltantes)
    query_cursos_sugeridos = f"""
        SELECT 
            subquery.nome,
            subquery.nivel,
            subquery.duracao,
            subquery.data_lancamento,
            subquery.habilidade
        FROM (
            SELECT DISTINCT 
                c.nome,
                c.nivel,
                c.duracao,
                TO_CHAR(c.data_lancamento, 'DD/MM/YYYY') AS data_lancamento,
                hc.habilidade
            FROM curso c
            INNER JOIN habilidade_curso hc 
            ON c.nome = hc.nome_curso
            WHERE hc.habilidade IN ('{habilidades_str}')
        ) AS subquery
        ORDER BY subquery.data_lancamento DESC
    """

    cursos_sugeridos = curso_model.db.execute_select_all(query_cursos_sugeridos)

    cursos_formatados = [
        {
            "nome": curso["nome"],
            "nivel": curso["nivel"],
            "duracao": curso["duracao"],
            "data_lancamento": curso["data_lancamento"],
            "habilidade": curso["habilidade"]
        }
        for curso in cursos_sugeridos
    ]

    return jsonify({
        "vaga": {
            "id": vaga["id"],
            "nome": vaga["vaga_nome"]
        },
        "habilidades_faltantes": habilidades_faltantes,
        "cursos_sugeridos": cursos_formatados
    }), 200
