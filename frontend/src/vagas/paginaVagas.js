import "../styles/main.css"
import "../styles/paginaVagas.css"

import { populateTable } from "./components/tablePaginaVagas.js"
import { buttonFunctionality } from "./functionalities/tableButtons.js"
import { inputFunctionality } from "./functionalities/formInput.js"
import { createHeader } from "../scripts/components/header.js"
import { createAside } from "../scripts/components/aside.js"
import { asideToggle } from "../scripts/functionalities/header.js"

const aside = document.querySelector("#app aside")

createHeader("Vagas Disponíveis")
createAside(aside)
asideToggle(aside)


const urlParams = new URLSearchParams(window.location.search)

if (!urlParams.has("page")) {
  urlParams.set("page", 1)
  window.location.search = urlParams
}

const response = await fetch("http://localhost:8000/vagas")
const data = await response.json()

const page = urlParams.get("page")
const size = data.length
const numberOfPages = Math.ceil(size / 10);

populateTable(page, data, numberOfPages, size)

buttonFunctionality(page, numberOfPages, urlParams)

inputFunctionality(urlParams)
