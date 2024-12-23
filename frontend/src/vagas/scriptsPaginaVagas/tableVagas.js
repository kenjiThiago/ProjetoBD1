import { buttonFunctionality } from "../../scripts/functionalities/tableButtons.js"

function populateTable(page, data, numberOfPages, size) {
  const total = document.querySelector("#table-footer p")
  const pages = document.querySelector("#pages p")

  total.innerHTML = `Número de Vagas: ${size}`

  if (size == 0) {
    pages.innerHTML = `Nenhuma Página`
    const tableWrapper = document.querySelector("#table-wrapper")
    tableWrapper.innerHTML += `
      <h1>Nenhuma Vaga Encontrada</h1>
    `

    return
  }

  pages.innerHTML = `Página ${size != 0 ? Number(page) : 0} de ${numberOfPages}`

  const tableBody = document.querySelector("#content tbody")

  for (let i = (page - 1) * 10; i < size && i < 10 * page; i++) {
    const row = `
      <tr data-href="/vagas/alunosInscritos/?id_vaga=${data[i].id}&page=1">
        <td>${data[i].vaga_nome}</td>
        <td>${data[i].empresa_nome}</td>
        <td>${data[i].numero_inscritos}</td>
        <td>${data[i].localizacao}</td>
        <td>${data[i].requisitos}</td>
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
  const nameV = urlParams.has("vaga") ? urlParams.get("vaga") : ""
  const company = urlParams.has("empresa") ? urlParams.get("empresa") : ""
  const localizacao = urlParams.has("localizacao") ? urlParams.get("localizacao") : ""
  const requisito = urlParams.has("requisito") ? urlParams.get("requisito") : ""

  const response = await fetch(`http://localhost:8000/vagas?nome=${nameV}&empresa=${company}&localizacao=${localizacao}&requisitos=${requisito}`)
  const data = await response.json()

  const page = urlParams.get("page")
  const size = data.vagas.length
  const numberOfPages = Math.ceil(size / 10);

  populateTable(page, data.vagas, numberOfPages, size)

  buttonFunctionality(page, numberOfPages, urlParams)
}
