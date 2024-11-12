from flask import Blueprint, jsonify, request
from Database.conector import DatabaseManager
from Database.classe_curso import Curso

curso_blueprint = Blueprint("curso", __name__)

@curso_blueprint.route("/cursos", methods = ["GET"])

def get_cursos():
    nome = request.args.get("nome", "")
    duracao = request.args.get("duracao", None)
    nivel = request.args.get("nivel", "")
    
    # Converte duracao para int
    duracao = int(duracao) if duracao else None

    cursos = Curso().get_cursos(nome, duracao, nivel)
    return jsonify(cursos), 200