import { buttonFunctionality } from "../../../../scripts/functionalities/tableButtons.js"

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
    const row = `
      <tr data-href="/cursos/?id=${data[i].nome}&page=1">
        <td>${data[i].nome}</td>
        <td>${data[i].nivel}</td>
        <td>${data[i].duracao} Horas</td>
        <td>${data[i].habilidade}</td>
        <td>${data[i].data_lancamento}</td>
      </tr>
    `

    tableBody.innerHTML += row;
  }

}

export async function createTable(urlParams) {
  const nameC = urlParams.has("curso_nome") ? urlParams.get("curso_nome") : ""
  const email = urlParams.has("email_aluno") ? urlParams.get("email_aluno") : ""
  const level = urlParams.has("nivel") ? urlParams.get("nivel") : ""
  const idV = urlParams.has("id_vaga") ? urlParams.get("id_vaga") : ""

  const emailUrl = email.replace("@", "%40")

  const response = await fetch(`http://localhost:8000/cursos_necessarios?email_aluno=${emailUrl}&id_vaga=${idV}&nome_curso=${nameC}&nivel=${level}`)
  const data = await response.json()

  const mainH1 = document.querySelector("main h1")
  mainH1.innerHTML = `${data.vaga.nome}`

  const mainH2 = document.querySelector("main h2")
  const skills = data.habilidades_faltantes.length !== 0 ? "Habilidades que Faltam: " + data.habilidades_faltantes.join(", ") : "Nenhuma Habilidade Faltante"
  mainH2.innerHTML = ` ${skills}`

  const page = urlParams.get("page")
  const size = data.cursos_sugeridos.length
  const numberOfPages = Math.ceil(size / 10);


  populateTable(page, data.cursos_sugeridos, numberOfPages, size)

  buttonFunctionality(page, numberOfPages, urlParams)
}
