from flask import Blueprint, jsonify
from Database.conector import DatabaseManager
from Database.classe_professor import Professor

professor_blueprint = Blueprint("professor", __name__)

@professor_blueprint.route("/professores", methods = ["GET"])

def get_professor():
    return jsonify(Professor().get_professores()), 200