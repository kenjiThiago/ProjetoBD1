import { buttonFunctionality } from "../../../scripts/functionalities/tableButtons.js"

function populateTable(page, data, numberOfPages, size) {
  const total = document.querySelector("#table-footer p")
  const pages = document.querySelector("#pages p")

  total.innerHTML = `Número de Alunos: ${size}`

  if (size == 0) {
    pages.innerHTML = `Nenhuma Página`
    const tableWrapper = document.querySelector("#table-wrapper")
    tableWrapper.innerHTML += `
      <h1>Nenhum Aluno Encontrado</h1>
    `

    return
  }

  pages.innerHTML = `Página ${size != 0 ? Number(page) : 0} de ${numberOfPages}`

  const tableBody = document.querySelector("#content tbody")

  for (let i = (page - 1) * 10; i < size && i < 10 * page; i++) {
    const row = `
      <tr data-href="/dashboardAluno/?email=${data[i].email}&page=1">
        <td>${data[i].nome}</td>
        <td>${data[i].email}</td>
        <td>${data[i].data_conclusao}</td>
        <td>${data[i].nota}</td>
      </tr>
    `

    tableBody.innerHTML += row;
  }

  const rows = document.querySelectorAll("tr[data-href]")

  rows.forEach(row => {
    row.addEventListener("click", () => {
      window.location.href = row.dataset.href;
    })
  })
}

export async function createTable(urlParams) {
  const nameC = urlParams.has("nomeC") ? urlParams.get("nomeC") : ""
  const nameA = urlParams.has("aluno") ? urlParams.get("aluno") : ""
  const year_start = urlParams.has("ano_conclusao") ? urlParams.get("ano_conclusao") : ""
  const year_end = urlParams.has("ano_conclusao_ate") ? urlParams.get("ano_conclusao_ate") : ""
  const ordering = urlParams.has("ordem") ? urlParams.get("ordem") : ""

  const response = await fetch(`http://localhost:8000/alunos_formados?curso=${nameC}&nome_aluno=${nameA}&ano_inicio=${year_start}&ano_fim=${year_end}&ordenar_ordem=${ordering}`)
  const data = await response.json()

  const mainH1 = document.querySelector("main h1")
  mainH1.innerHTML = `${data.curso.nome}`

  const mainH2 = document.querySelector("main h2")
  mainH2.innerHTML = `${data.curso.descricao}`

  const mainH3 = document.querySelector("main h3")
  let skills = []
  data.curso.habilidades.forEach(habilidade => {
    skills.push(`${habilidade.nome} (${habilidade.nivel})`)
  })

  skills = skills.join(", ")

  mainH3.innerHTML += ` ${skills}`

  const page = urlParams.get("page")
  const size = data.alunos_formados.length
  const numberOfPages = Math.ceil(size / 10);

  populateTable(page, data.alunos_formados, numberOfPages, size)

  buttonFunctionality(page, numberOfPages, urlParams)
}
