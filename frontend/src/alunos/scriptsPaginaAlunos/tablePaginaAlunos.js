import { buttonFunctionality } from "../../scripts/functionalities/tableButtons.js"

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
      <tr data-href="/alunos/vagas/?email_aluno=${data[i].email}&page=1">
        <td>${data[i].nome}</td>
        <td>${data[i].email}</td>
        <td>${data[i].numero_inscricoes}</td>
        <td>${data[i].status_plano}</td>
        <td>${data[i].idade}</td>
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
  const nameA = urlParams.has("nome") ? urlParams.get("nome") : ""
  const status = urlParams.has("status_plano") ? urlParams.get("status_plano") : ""

  const response = await fetch(`http://localhost:8000/alunos?nome=${nameA}&status_plano=${status}`)
  const data = await response.json()

  const page = urlParams.get("page")
  const size = data.alunos.length
  const numberOfPages = Math.ceil(size / 10);

  populateTable(page, data.alunos, numberOfPages, size)

  buttonFunctionality(page, numberOfPages, urlParams)
}
