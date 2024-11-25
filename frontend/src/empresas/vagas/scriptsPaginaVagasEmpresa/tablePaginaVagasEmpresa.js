import { buttonFunctionality } from "../../../scripts/functionalities/tableButtons.js"

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
      <tr data-href="/vagas/alunosInscritos/?id_vaga=1&page=1">
        <td>${data[i].vaga_nome}</td>
        <td>${data[i].numero_inscritos}</td>
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
  const nameC = urlParams.has("empresa_nome") ? urlParams.get("empresa_nome") : ""
  const nameV = urlParams.has("nome") ? urlParams.get("nome") : ""

  const response = await fetch(`http://localhost:8000/vagas_empresa?empresa=${nameC}&vaga=${nameV}`)
  const data = await response.json()

  const mainH1 = document.querySelector("main h1")
  mainH1.innerHTML = `${data.empresa.nome}`

  const mainH2 = document.querySelector("main h2")
  mainH2.innerHTML = `Setor: ${data.empresa.setor}`

  const page = urlParams.get("page")
  const size = data.vagas.length
  const numberOfPages = Math.ceil(size / 10);

  populateTable(page, data.vagas, numberOfPages, size)

  buttonFunctionality(page, numberOfPages, urlParams)
}

