from flask import Blueprint, jsonify, request
from Database.classe_vaga import Vaga
from Database.classe_empresa import Empresa

vagas_empresa_blueprint = Blueprint("vagas_empresa", __name__)

@vagas_empresa_blueprint.route("/vagas_empresa", methods=["GET"])
def get_vagas_empresa():
    empresa_nome = request.args.get("empresa", "")  
    vaga_nome = request.args.get("vaga", "")  

    if not empresa_nome:
        return jsonify({"error": "O nome da empresa é obrigatório"}), 400

    vaga_model = Vaga()
    empresa_model = Empresa()

    empresas = empresa_model.get_empresas(nome=empresa_nome)
    if not empresas:
        return jsonify({"error": f"A empresa '{empresa_nome}' não foi encontrada."}), 404

    empresa_info = {
        "nome": empresas[0]["empresa_nome"],
        "setor": empresas[0].get("setor", "Setor não especificado")
    }

    vagas = vaga_model.get_vagas(nome=vaga_nome, empresa=empresa_nome)

    vagas_formatadas = [
        {
            "vaga_nome": vaga["vaga_nome"],
            "numero_inscritos": vaga["numero_inscritos"],
            "requisitos": vaga["requisitos"]
        }
        for vaga in vagas
    ]

    return jsonify({
        "empresa": empresa_info,
        "vagas": vagas_formatadas
    }), 200
