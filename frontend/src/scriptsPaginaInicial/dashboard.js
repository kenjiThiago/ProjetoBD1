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
      <h2>Vagas Disponíveis</h2>
      <img src="${vagas}" alt="" />
    </div>
    <p><span>${data.num_vagas}</span></p>
  </a>
  <a href="/cursos/?page=1" class="card">
    <div class="card-title">
      <h2>Cursos Disponíveis</h2>
      <img src="${cursos}" alt="" />
    </div>
    <p><span>${data.num_cursos}</span></p>
  </a>
  <a href="/alunos/?page=1" class="card">
    <div class="card-title">
      <h2>Alunos Cadastrados</h2>
      <img src="${alunos}" alt="" />
    </div>
    <p><span>${data.num_alunos}</span></p>
  </a>
  <a href="/empresas/?page=1" class="card">
    <div class="card-title">
      <h2>Empresas Parceiras</h2>
      <img src="${empresas}" alt="" />
    </div>
    <p><span>${data.num_empresas}</span></p>
  </a>
  `

  statusGraph(data.num_alunos_ativos, data.num_alunos_inativos)
}
