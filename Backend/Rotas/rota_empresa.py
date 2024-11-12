from flask import Blueprint, jsonify, request
from Database.conector import DatabaseManager
from Database.classe_empresa import Empresa

empresa_blueprint = Blueprint("empresa", __name__)

@empresa_blueprint.route("/empresas", methods = ["GET"])

def get_empresas():
    nome = request.args.get("nome", "")
    setor = request.args.get("setor", "")
    localizacao = request.args.get("localizacao", "")
    
    empresas = Empresa().get_empresas(nome, setor, localizacao)
    return jsonify(empresas), 200