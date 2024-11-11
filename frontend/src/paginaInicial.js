import "./styles/main.css"
import "./styles/paginaInicial.css"

import "./scripts/components/header.js"
import "./scripts/components/aside.js"
import { createGraph } from "./scripts/components/graph.js"

const response = await fetch("http://localhost:8000")
const data = await response.json()

console.log(data)

const cards = document.querySelector("#card-wrapper")

cards.innerHTML = `
<div class="card">
  <h2>Número de Vagas</h2>
  <p><span>${data.num_vagas}</span> Vagas Disponíveis</p>
</div>
<div class="card">
  <h2>Número de Cursos</h2>
  <p><span>${data.num_cursos}</span> Cursos Disponíveis</p>
</div>
<div class="card">
  <h2>Número de Alunos</h2>
  <p><span>${data.num_alunos}</span> Alunos Cadastrados</p>
</div>
<div class="card">
  <h2>Número de Empresas</h2>
  <p><span>${data.num_empresas}</span> Empresas Parceiras</p>
</div>
`

createGraph(data.num_alunos_ativos, data.num_alunos_inativos)
