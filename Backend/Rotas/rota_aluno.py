from flask import Blueprint, jsonify, request
from Database.conector import DatabaseManager
from Database.classe_aluno import Aluno

aluno_blueprint = Blueprint("aluno", __name__)

@aluno_blueprint.route("/alunos", methods = ["GET"])

def get_alunos():
    nome = request.args.get("nome", "")
    status_plano = request.args.get("status_plano", "")
    email = request.args.get("email", "")

    alunos = Aluno().get_alunos(nome,status_plano, email)
    return jsonify(alunos), 200