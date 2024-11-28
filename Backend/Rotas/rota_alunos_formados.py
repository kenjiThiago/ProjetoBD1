from flask import Blueprint, jsonify, request
from Database.classe_aluno import Aluno
from Database.classe_curso import Curso

alunos_formados_blueprint = Blueprint("rota_alunos_formados", __name__)

@alunos_formados_blueprint.route("/alunos_formados", methods=["GET"])
def get_alunos_formados():
    nome_curso = request.args.get("curso", "").strip()
    nome_aluno = request.args.get("nome_aluno", "").strip()
    ano_conclusao = request.args.get("ano_conclusao", "").strip()

    if not nome_curso:
        return jsonify({"error": "O nome do curso é obrigatório"}), 400

    aluno_model = Aluno()
    curso_model = Curso()

    cursos = curso_model.get_cursos(nome=nome_curso)
    if not cursos:
        return jsonify({"error": "Curso não encontrado"}), 404

    curso_info = cursos[0]

    query_habilidades = f"""
    SELECT h.nome, h.nivel
    FROM Habilidade_Curso hc
    JOIN Habilidade h ON hc.id_habilidade = h.id
    WHERE hc.nome_curso = '{nome_curso}'
    """
    try:
        habilidades = curso_model.db.execute_select_all(query_habilidades)
        habilidades_lista = [
            {"nome": habilidade["nome"], "nivel": habilidade["nivel"]}
            for habilidade in habilidades
        ]
    except Exception as e:
        return jsonify({"error": f"Erro ao buscar habilidades: {str(e)}"}), 500

    query = f"""
    SELECT 
        a.nome AS aluno_nome,
        a.email AS aluno_email,
        TO_CHAR(e.data_conclusao, 'DD/MM/YYYY') AS data_conclusao,
        e.nota
    FROM 
        Estuda e
    INNER JOIN 
        Aluno a ON e.email_aluno = a.email
    WHERE 
        e.nome_curso = '{nome_curso}'
        AND e.data_conclusao IS NOT NULL
    """
    if nome_aluno:
        query += f" AND LOWER(a.nome) LIKE '%{nome_aluno.lower()}%'"
    if ano_conclusao:
        query += f" AND EXTRACT(YEAR FROM e.data_conclusao) = {ano_conclusao}"

    query += " ORDER BY a.nome ASC"

    try:
        alunos = aluno_model.db.execute_select_all(query)
        alunos_formatados = [
            {
                "nome": aluno["aluno_nome"],
                "email": aluno["aluno_email"],
                "data_conclusao": aluno["data_conclusao"],
                "nota": aluno["nota"]
            }
            for aluno in alunos
        ]
    except Exception as e:
        return jsonify({"error": f"Erro ao buscar alunos: {str(e)}"}), 500

    return jsonify({
        "curso": {
            "nome": curso_info["nome"],
            "descricao": curso_info["descricao"],
            "habilidades": habilidades_lista
        },
        "alunos_formados": alunos_formatados
    }), 200
