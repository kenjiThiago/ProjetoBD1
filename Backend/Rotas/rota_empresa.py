from flask import Blueprint, jsonify
from Database.conector import DatabaseManager
from Database.classe_empresa import Empresa

empresa_blueprint = Blueprint("empresa", __name__)

@empresa_blueprint.route("/empresas", methods = ["GET"])

def get_empresas():
    return jsonify(Empresa().get_empresas()), 200