import vagas from "../../assets/vagas.svg"
import alunos from "../../assets/alunos.svg"

import { courseGraph } from "../../scripts/components/graph.js"
import { createTable } from "./tableDashboardAluno.js"

export async function createDashboard(urlParams) {
  const email = urlParams.has("email") ? urlParams.get("email") : ""
  const course = urlParams.has("curso") ? urlParams.get("curso") : ""
  const skill = urlParams.has("habilidade") ? urlParams.get("habilidade") : ""

  const response = await fetch(`http://localhost:8000/dashboard?email_aluno=${email}&nome_curso=${course}&habilidade=${skill}`)
  const data = await response.json()

  const skills = data.dashboard.habilidades_totais.join(", ")

  const mainH1 = document.querySelector("main h1")
  mainH1.innerHTML = `${data.aluno.nome}`

  const cards = document.querySelector("#card-wrapper")

  cards.innerHTML = `
  <div href="/vagas/?page=1" class="card">
    <div class="card-title">
      <h2>Número de Vagas</h2>
      <img src="${vagas}" />
    </div>
    <p><span>${data.dashboard.vagas_inscritas}</span> Vagas Inscritas</p>
  </div>
  <div href="/alunos/?page=1" class="card">
    <div class="card-title">
      <h2>Status Aluno</h2>
      <img src="${alunos}" />
    </div>
    <p style="color: green; font-weight: bold; font-size: 3rem;">${data.aluno.status_plano}</p>
  </div>
  <div href="/cursos/?page=1" class="card">
    <div class="card-title">
      <h2>Habilidades do Aluno</h2>
    </div>
    <p>${skills}</p>
  </div>
  `
  courseGraph(data.dashboard.cursos_concluidos, data.dashboard.cursos_nao_concluidos)
  createTable(urlParams, data.cursos_concluidos_detalhes)
}
