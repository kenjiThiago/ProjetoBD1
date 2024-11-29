import { buttonFunctionality } from "../../../scripts/functionalities/tableButtons.js"

function populateTable(page, data, numberOfPages, size, email) {
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
    const emailUrl = email.replace("@", "%40")
    const row = `
      <tr data-href="/alunos/vagas/cursos/?id_vaga=${data[i].vaga_id}&email_aluno=${emailUrl}&page=1">
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
  const email = urlParams.has("email_aluno") ? urlParams.get("email_aluno") : ""
  const nameV = urlParams.has("nome") ? urlParams.get("nome") : ""
  const company = urlParams.has("empresa") ? urlParams.get("empresa") : ""
  const locationV = urlParams.has("localizacao") ? urlParams.get("localizacao") : ""
  const requiriment = urlParams.has("requisito") ? urlParams.get("requisito") : ""
  const ordering = urlParams.has("ordem") ? urlParams.get("ordem") : ""

  const response = await fetch(`http://localhost:8000/vagas_inscritas?email_aluno=${email}&vaga_nome=${nameV}&empresa_nome=${company}&requisitos=${requiriment}&localizacao=${locationV}&ordenar_numero_inscritos=${ordering}`)
  const data = await response.json()

  const mainH1 = document.querySelector("main h1")
  mainH1.innerHTML = `${data.aluno_nome}`

  const mainH3 = document.querySelector("main h3")
  mainH3.innerHTML += data.habilidades_aluno[0].habilidade

  const page = urlParams.get("page")
  const size = data.vagas_inscritas.length
  const numberOfPages = Math.ceil(size / 10);

  populateTable(page, data.vagas_inscritas, numberOfPages, size, email)

  buttonFunctionality(page, numberOfPages, urlParams)
}
