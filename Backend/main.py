from flask import Flask, jsonify
from flask_cors import CORS
from Rotas.rota_aluno import aluno_blueprint
from Rotas.rota_curso import curso_blueprint
from Rotas.rota_empresa import empresa_blueprint
from Rotas.rota_professor import professor_blueprint
from Rotas.rota_vaga import vaga_blueprint
from Rotas.rota_vagas_inscritas import vagas_inscritas_blueprint
from Rotas.rota_vagas_da_empresa import vagas_empresa_blueprint
from Rotas.rota_alunos_formados import alunos_formados_blueprint
from Database.classe_aluno import Aluno
from Database.classe_curso import Curso
from Database.classe_empresa import Empresa
from Database.classe_vaga import Vaga

app = Flask(__name__)
CORS(app, origins="*")

@app.route("/", methods=["GET"])
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

app.register_blueprint(aluno_blueprint)
app.register_blueprint(curso_blueprint)
app.register_blueprint(empresa_blueprint)
app.register_blueprint(professor_blueprint)
app.register_blueprint(vaga_blueprint)
app.register_blueprint(vagas_inscritas_blueprint)
app.register_blueprint(vagas_empresa_blueprint)
app.register_blueprint(alunos_formados_blueprint)

app.run("0.0.0.0", port=8000, debug=False)

