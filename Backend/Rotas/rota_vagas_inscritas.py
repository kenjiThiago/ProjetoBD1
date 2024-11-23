from flask import Blueprint, jsonify, request
from Database.classe_vaga import Vaga

vagas_inscritas_blueprint = Blueprint("vagas_inscritas", __name__)

@vagas_inscritas_blueprint.route("/vagas_inscritas", methods=["GET"])
def get_vagas_inscritas():
    email_aluno = request.args.get("email_aluno", "")
    vaga_nome = request.args.get("vaga_nome", "")
    empresa_nome = request.args.get("empresa_nome", "")
    
    if not email_aluno:
        return jsonify({"error": "O email_aluno do aluno é obrigatório"}), 400

    vaga_model = Vaga()

    vagas = vaga_model.get_vagas(nome=vaga_nome, empresa=empresa_nome)
    if vagas:
        vaga_id = vagas[0]['id']  
    else:
        vaga_id = None  

    dados = vaga_model.get_vagas_inscritas_por_aluno(email_aluno, vaga_nome, empresa_nome, vaga_id)
    
    if not vagas:
        dados['vagas_inscritas'] = []

    return jsonify(dados), 200
