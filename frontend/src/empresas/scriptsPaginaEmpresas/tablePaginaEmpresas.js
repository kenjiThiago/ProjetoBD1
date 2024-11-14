import { buttonFunctionality } from "../../scripts/functionalities/tableButtons"

function populateTable(page, data, numberOfPages, size) {
  const total = document.querySelector("#table-footer p")
  const pages = document.querySelector("#pages p")

  total.innerHTML = `Número de Empresas: ${size}`

  if (size == 0) {
    pages.innerHTML = `Nenhuma Página`
    const tableWrapper = document.querySelector("#table-wrapper")
    tableWrapper.innerHTML += `
      <h1>Nenhuma Empresa Encontrada</h1>
    `

    return
  }

  pages.innerHTML = `Página ${size != 0 ? Number(page) : 0} de ${numberOfPages}`

  const tableBody = document.querySelector("#content tbody")

  for (let i = (page - 1) * 10; i < size && i < 10 * page; i++) {
    const row = `
      <tr data-href="/empresas/vagas/?id=${data[i].id}&page=1">
        <td>${data[i].nome}</td>
        <td>${data[i].localizacao}</td>
        <td>${data[i].setor}</td>
        <td>${data[i].num_vagas}</td>
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
  const location = urlParams.has("localizacao") ? urlParams.get("localizacao") : ""
  const nameC = urlParams.has("nome") ? urlParams.get("nome") : ""

  const response = await fetch(`http://localhost:8000/empresas?nome=${nameC}&localizacao=${location}`)
  const data = await response.json()

  const page = urlParams.get("page")
  const size = data.empresas.length
  const numberOfPages = Math.ceil(size / 10);


  populateTable(page, data.empresas, numberOfPages, size)

  buttonFunctionality(page, numberOfPages, urlParams)
}
