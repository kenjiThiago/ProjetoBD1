import vagas from "../assets/vagas.svg"
import cursos from "../assets/cursos.svg"
import empresas from "../assets/empresas.svg"
import alunos from "../assets/alunos.svg"

import { statusGraph } from "../scripts/components/graph.js"

export async function createDashboard() {
  const response = await fetch("http://localhost:8000")
  const data = await response.json()

  const cards = document.querySelector("#card-wrapper")

  cards.innerHTML = `
  <a href="/vagas/?page=1" class="card">
    <div class="card-title">
      <h2>Número de Vagas</h2>
      <img src="${vagas}" />
    </div>
    <p><span>${data.num_vagas}</span> Vagas Disponíveis</p>
  </a>
  <a href="/cursos/?page=1" class="card">
    <div class="card-title">
      <h2>Número de Cursos</h2>
      <img src="${cursos}" />
    </div>
    <p><span>${data.num_cursos}</span> Cursos Disponíveis</p>
  </a>
  <a href="/alunos/?page=1" class="card">
    <div class="card-title">
      <h2>Número de Alunos</h2>
      <img src="${alunos}" />
    </div>
    <p><span>${data.num_alunos}</span> Alunos Cadastrados</p>
  </a>
  <a href="/empresas/?page=1" class="card">
    <div class="card-title">
      <h2>Número de Empresas</h2>
      <img src="${empresas}" />
    </div>
    <p><span>${data.num_empresas}</span> Empresas Parceiras</p>
  </a>
  `

  statusGraph(data.num_alunos_ativos, data.num_alunos_inativos)
}
