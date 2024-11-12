from flask import Flask, jsonify
from flask_cors import CORS
from Rotas.rota_aluno import aluno_blueprint
from Rotas.rota_curso import curso_blueprint
from Rotas.rota_empresa import empresa_blueprint
from Rotas.rota_professor import professor_blueprint
from Rotas.rota_vaga import vaga_blueprint

app = Flask(__name__)
CORS(app, origins="*")

@app.route("/", methods=["GET"])
def get_autor():
    return jsonify("CODIFY!"), 200

app.register_blueprint(aluno_blueprint)
app.register_blueprint(curso_blueprint)
app.register_blueprint(empresa_blueprint)
app.register_blueprint(professor_blueprint)
app.register_blueprint(vaga_blueprint)

app.run("0.0.0.0", port=8000, debug=False)

