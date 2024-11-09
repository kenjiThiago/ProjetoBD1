from flask import Blueprint, jsonify
from Database.conector import DatabaseManager
from Database.classe_curso import Curso

curso_blueprint = Blueprint("curso", __name__)

@curso_blueprint.route("/cursos", methods = ["GET"])

def get_alunos():
    return jsonify(Curso().get_cursos()), 200