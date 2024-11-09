from flask import Blueprint, jsonify
from Database.conector import DatabaseManager
from Database.classe_vaga import Vaga

vaga_blueprint = Blueprint("vaga", __name__)

@vaga_blueprint.route("/vagas", methods = ["GET"])

def get_vagas():
    return jsonify(Vaga().get_vagas()), 200