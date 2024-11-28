from flask import Blueprint, jsonify, request
from Database.classe_aluno import Aluno

dashboard_blueprint = Blueprint("rota_dashboard", __name__)

@dashboard_blueprint.route("/dashboard", methods=["GET"])
def aluno_dashboard():
    email_aluno = request.args.get("email_aluno", "").strip()
    filtro_nome_curso = request.args.get("nome_curso", "").strip()
    filtro_habilidade = request.args.get("habilidade", "").strip()

    if not email_aluno:
        return jsonify({"error": "Parâmetro 'email_aluno' é obrigatório"}), 400

    aluno_model = Aluno()

    query_verifica_aluno = f"""
    SELECT email, nome, status_plano
    FROM Aluno
    WHERE email = '{email_aluno}'
    """
    aluno = aluno_model.db.execute_select_one(query_verifica_aluno)
    if not aluno:
        return jsonify({"error": "Aluno não encontrado"}), 404

    query_total_cursos = "SELECT COUNT(*) AS total_cursos FROM Curso"
    total_cursos = aluno_model.db.execute_select_one(query_total_cursos)["total_cursos"]

    query_cursos_concluidos = f"""
    SELECT COUNT(*) AS cursos_concluidos
    FROM Estuda
    WHERE email_aluno = '{email_aluno}' AND data_conclusao IS NOT NULL
    """
    cursos_concluidos = aluno_model.db.execute_select_one(query_cursos_concluidos)["cursos_concluidos"]

    cursos_nao_concluidos = total_cursos - cursos_concluidos

    query_vagas_inscritas = f"""
    SELECT COUNT(*) AS vagas_inscritas
    FROM Se_Inscreve
    WHERE email_aluno = '{email_aluno}'
    """
    vagas_inscritas = aluno_model.db.execute_select_one(query_vagas_inscritas)["vagas_inscritas"]

    query_habilidades_totais = f"""
    SELECT DISTINCT h.nome || ': ' || h.nivel AS habilidade
    FROM Estuda e
    INNER JOIN Habilidade_Curso hc ON e.nome_curso = hc.nome_curso
    INNER JOIN Habilidade h ON hc.id_habilidade = h.id
    WHERE e.email_aluno = '{email_aluno}' AND e.data_conclusao IS NOT NULL
    """
    habilidades_totais = aluno_model.db.execute_select_all(query_habilidades_totais)
    habilidades_totais = [h["habilidade"] for h in habilidades_totais]

    query_detalhes_cursos_concluidos = f"""
    SELECT 
        c.nome, 
        c.nivel, 
        TO_CHAR(e.data_conclusao, 'DD/MM/YYYY') AS data_conclusao,
        e.nota
    FROM Curso c
    INNER JOIN Estuda e ON c.nome = e.nome_curso
    WHERE e.email_aluno = '{email_aluno}' AND e.data_conclusao IS NOT NULL
    """
    if filtro_nome_curso:
        query_detalhes_cursos_concluidos += f" AND c.nome ILIKE '%{filtro_nome_curso}%'"
    if filtro_habilidade:
        query_detalhes_cursos_concluidos += f"""
        AND c.nome IN (
            SELECT nome_curso
            FROM Habilidade_Curso hc
            INNER JOIN Habilidade h ON hc.id_habilidade = h.id
            WHERE h.nome ILIKE '%{filtro_habilidade}%'
        )
        """
    cursos_concluidos_detalhes = aluno_model.db.execute_select_all(query_detalhes_cursos_concluidos)

    for curso in cursos_concluidos_detalhes:
        query_habilidades_curso = f"""
        SELECT h.nome || ': ' || h.nivel AS habilidade
        FROM Habilidade_Curso hc
        INNER JOIN Habilidade h ON hc.id_habilidade = h.id
        WHERE hc.nome_curso = '{curso["nome"]}'
        """
        habilidades = aluno_model.db.execute_select_all(query_habilidades_curso)
        curso["habilidades"] = [h["habilidade"] for h in habilidades]

    return jsonify({
        "aluno": {
            "email": aluno["email"],
            "nome": aluno["nome"],
            "status_plano": aluno["status_plano"]
        },
        "dashboard": {
            "cursos_concluidos": cursos_concluidos,
            "cursos_nao_concluidos": cursos_nao_concluidos,
            "vagas_inscritas": vagas_inscritas,
            "habilidades_totais": habilidades_totais
        },
        "cursos_concluidos_detalhes": cursos_concluidos_detalhes
    }), 200
