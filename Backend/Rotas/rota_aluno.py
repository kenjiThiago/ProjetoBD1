from flask import Blueprint, jsonify
from Database.conector import DatabaseManager
from Database.classe_aluno import Aluno

aluno_blueprint = Blueprint("aluno", __name__)

@aluno_blueprint.route("/alunos", methods = ["GET"])

def get_alunos():
    return jsonify(Aluno().get_alunos()), 200