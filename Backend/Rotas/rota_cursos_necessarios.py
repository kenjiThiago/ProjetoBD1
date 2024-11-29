from flask import Blueprint, jsonify, request
from Database.classe_vaga import Vaga
from Database.classe_curso import Curso
from Database.classe_aluno import Aluno

cursos_necessarios_blueprint = Blueprint("rota_cursos_necessarios", __name__)

@cursos_necessarios_blueprint.route("/cursos_necessarios", methods=["GET"])
def get_cursos_necessarios():
    email_aluno = request.args.get("email_aluno", "").strip()
    id_vaga = request.args.get("id_vaga", "").strip()
    nivel = request.args.get("nivel", "").strip()
    nome_curso = request.args.get("nome_curso", "").strip()

    if not email_aluno or not id_vaga:
        return jsonify({"error": "Parâmetros 'email_aluno' e 'id_vaga' são obrigatórios"}), 400

    vaga_model = Vaga()
    curso_model = Curso()
    aluno_model = Aluno()

    vaga = vaga_model.get_vagas(id=int(id_vaga))
    if not vaga:
        return jsonify({"error": "Vaga não encontrada"}), 404

    vaga = vaga[0]  

    # Consultando as habilidades e os níveis necessários para a vaga
    query_habilidades_vaga = f"""
    SELECT DISTINCT h.nome AS habilidade, h.nivel
    FROM habilidade_vaga hv
    INNER JOIN habilidade h ON hv.id_habilidade = h.id
    WHERE hv.id_vaga = {id_vaga}
    """
    habilidades_vaga = vaga_model.db.execute_select_all(query_habilidades_vaga)
    habilidades_vaga = [f"{h['habilidade']}: {h['nivel']}" for h in habilidades_vaga]

    # Consultando as habilidades do aluno
    query_habilidades_aluno = f"""
    SELECT DISTINCT h.nome AS habilidade, h.nivel
    FROM habilidade_curso hc
    INNER JOIN estuda e ON hc.nome_curso = e.nome_curso
    INNER JOIN habilidade h ON hc.id_habilidade = h.id
    WHERE e.email_aluno = '{email_aluno}'
    """
    habilidades_aluno = aluno_model.db.execute_select_all(query_habilidades_aluno)
    habilidades_aluno = [f"{h['habilidade']}: {h['nivel']}" for h in habilidades_aluno]

    habilidades_faltantes = [h for h in habilidades_vaga if f"{h.split(':')[0]}: {h.split(':')[1]}" not in habilidades_aluno]

    if not habilidades_faltantes:
        return jsonify({
            "vaga": {"id": vaga["id"], "nome": vaga["vaga_nome"]},
            "habilidades_faltantes": [],
            "habilidades_que_o_aluno_ja_tem": habilidades_aluno,
            "cursos_sugeridos": []
        }), 200

    habilidades_str = "', '".join([h.split(":")[0] for h in habilidades_faltantes])

    # Consultando os cursos sugeridos com base nas habilidades faltantes
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
                h.nome AS habilidade
            FROM curso c
            INNER JOIN habilidade_curso hc ON c.nome = hc.nome_curso
            INNER JOIN habilidade h ON hc.id_habilidade = h.id
            WHERE h.nome IN ('{habilidades_str}')
    """

    if nivel:
        query_cursos_sugeridos += f" AND LOWER(c.nivel) = LOWER('{nivel}')"

    if nome_curso:
        query_cursos_sugeridos += f" AND LOWER(c.nome) LIKE '%{nome_curso.lower()}%'"

    query_cursos_sugeridos += """
        ) AS subquery
        ORDER BY subquery.nome ASC
    """

    cursos_sugeridos = curso_model.db.execute_select_all(query_cursos_sugeridos)

    cursos_formatados = [
        {
            "nome": curso["nome"],
            "nivel": curso["nivel"],
            "duracao": curso["duracao"],
            "data_lancamento": curso["data_lancamento"],
            "habilidade": f"{curso['habilidade']}: {curso['nivel']}"  # Formato de habilidade
        }
        for curso in cursos_sugeridos
    ]

    return jsonify({
        "vaga": {
            "id": vaga["id"],
            "nome": vaga["vaga_nome"],
            "habilidades_necessarias": habilidades_vaga  # As habilidades com o formato desejado
        },
        "habilidades_faltantes": habilidades_faltantes,
        "habilidades_que_o_aluno_ja_tem": habilidades_aluno,
        "cursos_sugeridos": cursos_formatados
    }), 200
