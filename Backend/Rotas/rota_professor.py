from flask import Blueprint, jsonify, request
from Database.conector import DatabaseManager
from Database.classe_professor import Professor

professor_blueprint = Blueprint("professor", __name__)

@professor_blueprint.route("/professores", methods = ["GET"])

def get_professor():
    nome = request.args.get("nome", "")
    especializacao = request.args.get("especializacao", "")
    email = request.args.get("email", "")
    
    professores = Professor().get_professores(nome, especializacao, email)
    return jsonify(professores), 200