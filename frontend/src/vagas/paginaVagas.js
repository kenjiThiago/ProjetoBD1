import "../styles/main.css"
import "../styles/table.css"

import { populateTable } from "./components/tablePaginaVagas.js"
import { buttonFunctionality } from "../scripts/functionalities/tableButtons.js"
import { inputFunctionality } from "./functionalities/formInput.js"
import { createHeader } from "../scripts/components/header.js"
import { createAside } from "../scripts/components/aside.js"
import { asideToggle } from "../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../scripts/functionalities/removeFilters.js"

const aside = document.querySelector("#app aside")

createHeader("Vagas Disponíveis")
createAside(aside, "vagas")
asideToggle(aside)


const urlParams = new URLSearchParams(window.location.search)
const nameV = urlParams.has("nomeV") ? urlParams.get("nomeV") : ""
const nameE = urlParams.has("nomeE") ? urlParams.get("nomeE") : ""

const response = await fetch(`http://localhost:8000/vagas?nome=${nameV}&empresa=${nameE}`)
const data = await response.json()

const page = urlParams.get("page")
const size = data.vagas.length
const numberOfPages = Math.ceil(size / 10);

createRemoveFilterButton()

populateTable(page, data.vagas, numberOfPages, size)

buttonFunctionality(page, numberOfPages, urlParams)

inputFunctionality(urlParams)
