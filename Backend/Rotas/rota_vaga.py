from flask import Blueprint, jsonify, request
from Database.classe_vaga import Vaga

vaga_blueprint = Blueprint("vaga", __name__)

@vaga_blueprint.route("/vagas", methods=["GET"])
def get_vagas():
    id = request.args.get("id", type=int)
    nome = request.args.get("nome", "")
    empresa = request.args.get("empresa", "")
    
    vaga_model = Vaga()
    vagas = vaga_model.get_vagas(id, nome=nome, empresa=empresa)

    response_data = {
        "vagas": vagas
    }

    return jsonify(response_data), 200
