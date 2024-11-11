import "../scripts/components/header.js"
import "../scripts/components/aside.js"

import "../styles/main.css"
import "../styles/vagas.css"

//const response = await fetch("http://localhost:8000/vagas")
//const data = await response.json()
const data = [
  { 'id': 1,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 2,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 3,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 4,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 5,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 6,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 7,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 8,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 9,    'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 10,   'name': 'Desenvolvedor Front-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
  { 'id': 11,   'name': 'Desenvolvedor Back-end.', 'empresa': 'Empresa', 'inscritos': 'Número de Inscritos', 'localizacao': 'Localização', 'requisitos': 'Requisitos' },
]

const urlParams = new URLSearchParams(window.location.search)

if (!urlParams.has("page")) {
  urlParams.set("page", 1)
  window.location.search = urlParams
}

const pages = document.querySelector("#pages p")

const size = data.length
const numeberOfPages = Math.ceil(size / 10);

const total = document.querySelector("#table-footer p")
const page = urlParams.get("page")

total.innerHTML = `Número de vagas: ${size}`
pages.innerHTML = `Página ${Number(page)} de ${numeberOfPages}`

const tableBody = document.querySelector("#content tbody")

for (let i = (page - 1) * 10; i < size && i < 10 * page; i++) {
  const row = `
    <tr data-href="/vagas/?id=${data[i].id}">
      <td>${data[i].name}</td>
      <td>${data[i].empresa}</td>
      <td>${data[i].inscritos}</td>
      <td>${data[i].localizacao}</td>
      <td>${data[i].requisitos}</td>
    </tr>
  `

  tableBody.innerHTML += row;
}

const forward = document.querySelector("#forward")

if (page == numeberOfPages) {
  forward.toggleAttribute("disabled", "disabled")
  forward.style.opacity = "0.5"
} else {
  forward.addEventListener("click", () => {
    urlParams.set("page", Number(page) + 1)
    window.location.search = urlParams
  })
}

const backward = document.querySelector("#backward")

if (page == 1) {
  backward.toggleAttribute("disabled", "disabled")
  backward.style.opacity = "0.5"
} else {
  backward.addEventListener("click", () => {
    urlParams.set("page", Number(page) - 1)
    window.location.search = urlParams
  })
}

const input = document.querySelector("form input")

if (urlParams.get("nomeV") !== "") {
  input.value = urlParams.get("nomeV")
}
