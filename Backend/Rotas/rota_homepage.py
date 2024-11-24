from flask import Blueprint, jsonify
from Database.classe_aluno import Aluno
from Database.classe_curso import Curso
from Database.classe_empresa import Empresa
from Database.classe_vaga import Vaga

homepage_blueprint = Blueprint("homepage", __name__)

@homepage_blueprint.route("/", methods=["GET"])
def dados_homepage():
    aluno = Aluno()
    curso = Curso()
    empresa = Empresa()
    vaga = Vaga()

    n_alunos = aluno.count_ativos() + aluno.count_inativos()
    n_cursos = curso.get_numero_cursos()
    n_empresas = empresa.get_numero_empresas()
    n_vagas = vaga.get_numero_vagas()
    n_alunos_ativos = aluno.count_ativos()
    n_alunos_inativos = aluno.count_inativos()

    dados_homepage = {
        "num_alunos": n_alunos,
        "num_cursos": n_cursos,
        "num_empresas": n_empresas,
        "num_vagas": n_vagas,
        "num_alunos_ativos": n_alunos_ativos,
        "num_alunos_inativos": n_alunos_inativos
    }

    return jsonify(dados_homepage), 200
