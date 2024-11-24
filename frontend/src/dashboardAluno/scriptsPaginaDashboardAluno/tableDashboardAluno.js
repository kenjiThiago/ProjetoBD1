import { buttonFunctionality } from "../../scripts/functionalities/tableButtons.js"

function populateTable(page, data, numberOfPages, size) {
  const total = document.querySelector("#table-footer p")
  const pages = document.querySelector("#pages p")

  total.innerHTML = `Número de Cursos: ${size}`

  if (size == 0) {
    pages.innerHTML = `Nenhuma Página`
    const tableWrapper = document.querySelector("#table-wrapper")
    tableWrapper.innerHTML += `
      <h1>Nenhum Curso Encontrado</h1>
    `

    return
  }

  pages.innerHTML = `Página ${size != 0 ? Number(page) : 0} de ${numberOfPages}`

  const tableBody = document.querySelector("#content tbody")

  for (let i = (page - 1) * 10; i < size && i < 10 * page; i++) {
    const skills = data[i].habilidades.join(", ")
    const row = `
      <tr data-href="/vagas/alunos/?id=${data[i].id}&page=1">
        <td>${data[i].nome}</td>
        <td>${data[i].nivel}</td>
        <td>${data[i].data_conclusao}</td>
        <td>${data[i].nota}</td>
        <td>${skills}</td>
      </tr>
    `

    tableBody.innerHTML += row;
  }
}

export async function createTable(urlParams, data) {
  const page = urlParams.get("page")
  const size = data.length
  const numberOfPages = Math.ceil(size / 10);

  populateTable(page, data, numberOfPages, size)

  buttonFunctionality(page, numberOfPages, urlParams)
}
