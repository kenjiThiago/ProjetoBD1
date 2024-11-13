import "../styles/main.css"
import "../styles/table.css"

import { populateTable } from "./scriptsPaginaVagas/tablePaginaVagas.js"
import { buttonFunctionality } from "../scripts/functionalities/tableButtons.js"
import { inputFunctionality } from "./scriptsPaginaVagas/formInput.js"
import { createHeader } from "../scripts/components/header.js"
import { createAside } from "../scripts/components/aside.js"
import { asideToggle } from "../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../scripts/functionalities/removeFilters.js"

const aside = document.querySelector("#app aside")

createHeader("Vagas Disponíveis")
createAside(aside, "vagas")
asideToggle(aside)


const urlParams = new URLSearchParams(window.location.search)
const name = urlParams.has("nome") ? urlParams.get("nome") : ""
const company = urlParams.has("empresa") ? urlParams.get("empresa") : ""

const response = await fetch(`http://localhost:8000/vagas?nome=${name}&empresa=${company}`)
const data = await response.json()

const page = urlParams.get("page")
const size = data.vagas.length
const numberOfPages = Math.ceil(size / 10);

createRemoveFilterButton()

populateTable(page, data.vagas, numberOfPages, size)

buttonFunctionality(page, numberOfPages, urlParams)

inputFunctionality(urlParams)
