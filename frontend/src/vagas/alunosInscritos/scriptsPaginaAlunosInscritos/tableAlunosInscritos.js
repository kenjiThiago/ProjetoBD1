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
      <tr>
        <td>${data[i].nome}</td>
        <td>${data[i].email}</td>
        <td>${data[i].cursos_concluidos}</td>
        <td>${data[i].habilidades}</td>
      </tr>
    `

    tableBody.innerHTML += row;
  }

  //const rows = document.querySelectorAll("tr[data-href]")
  //
  //rows.forEach(row => {
  //  row.addEventListener("click", () => {
  //    window.location.href = row.dataset.href;
  //  })
  //})
}

export async function createTable(urlParams) {
  const idV = urlParams.has("id_vaga") ? urlParams.get("id_vaga") : ""
  const qualification = urlParams.has("qualificacao") ? urlParams.get("qualificacao") : ""
  const nameS = urlParams.has("aluno") ? urlParams.get("aluno") : ""

  const response = await fetch(`http://localhost:8000/alunos_inscritos?id_vaga=${idV}&qualificacao=${qualification}&nome_aluno=${nameS}`)
  const data = await response.json()

  const mainH1 = document.querySelector("main h1")
  mainH1.innerHTML = data.vaga.nome

  const mainH2 = document.querySelector("main h2")
  mainH2.innerHTML = data.vaga.descricao

  const mainH3 = document.querySelector("main h3")
  data.vaga.requisitos.forEach(habilidade => {
    mainH3.innerHTML += ` ${habilidade}`
  })

  const page = urlParams.get("page")
  const size = data.alunos.length
  const numberOfPages = Math.ceil(size / 10);

  populateTable(page, data.alunos, numberOfPages, size)

  buttonFunctionality(page, numberOfPages, urlParams)
}
