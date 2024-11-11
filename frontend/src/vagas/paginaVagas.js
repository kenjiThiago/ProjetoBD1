import "../scripts/components/header.js"
import "../scripts/components/aside.js"
import { populateTable } from "./components/tablePaginaVagas.js"
import { buttonFunctionality } from "./functionalities/tableButtons.js"
import { inputFunctionality } from "./functionalities/formInput.js"

import "../styles/main.css"
import "../styles/vagas.css"

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
