import vagas from "../../assets/vagas.svg"
import alunos from "../../assets/alunos.svg"
import habilidades from "../../assets/skills.svg"

import { courseGraph } from "../../scripts/components/graph.js"
import { createTable } from "./tableDashboardAluno.js"

export async function createDashboard(urlParams) {
  const email = urlParams.has("email") ? urlParams.get("email") : ""
  const course = urlParams.has("curso") ? urlParams.get("curso") : ""
  const skill = urlParams.has("habilidade") ? urlParams.get("habilidade") : ""

  const emailUrl = email.replace("@", "%40")

  const response = await fetch(`http://localhost:8000/dashboard?email_aluno=${emailUrl}&nome_curso=${course}&habilidade=${skill}`)
  const data = await response.json()

  const skills = data.dashboard.habilidades_totais.length !== 0 ? data.dashboard.habilidades_totais.join(", ") : "Nenhuma Habilidade"
  const status = data.aluno.status_plano == "ativo" ? "Ativo" : "Inativo"
  const classStatus = data.aluno.status_plano == "ativo" ? "" : "inactive"

  const mainH1 = document.querySelector("main h1")
  mainH1.innerHTML = `${data.aluno.nome}`

  const cards = document.querySelector("#card-wrapper")

  cards.innerHTML = `
  <a href="/alunos/vagas/?email_aluno=${emailUrl}&page=1" class="card">
    <div class="card-title">
      <h2>Vagas Inscritas</h2>
      <img src="${vagas}" alt="" />
    </div>
    <p><span>${data.dashboard.vagas_inscritas}</span></p>
  </a>
  <div class="card">
    <div class="card-title">
      <h2>Status Aluno</h2>
      <img src="${alunos}" alt="" />
    </div>
    <p id="status" class="${classStatus}">${status}</p>
  </div>
  <div class="card">
    <div class="card-title">
      <h2>Habilidades do Aluno</h2>
      <img src="${habilidades}" alt="" />
    </div>
    <ul id="list">
    </ul>
  </div>
  `

  const skillList = document.querySelector("#list")
  console.log(skillList)
  data.dashboard.habilidades_totais.forEach(habilidade => {
    skillList.innerHTML += `
      <li>${habilidade}</li>
    `
  })

  courseGraph(data.dashboard.cursos_concluidos, data.dashboard.cursos_nao_concluidos)
  createTable(urlParams, data.cursos_concluidos_detalhes)
}
