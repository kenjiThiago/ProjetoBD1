import "../styles/main.css"
import "../styles/table.css"

import { createHeader } from "../scripts/components/header"
import { createAside } from "../scripts/components/aside"
import { asideToggle } from "../scripts/functionalities/header"
import { createRemoveFilterButton } from "../scripts/functionalities/removeFilters"
import { buttonFunctionality } from "../scripts/functionalities/tableButtons"
import { populateTable } from "./scriptsPaginaEmpresas/tablePaginaVagas"
import { inputFunctionality } from "./scriptsPaginaEmpresas/formInput"

const aside = document.querySelector("#app aside")

createHeader("Empresas Parceiras")
createAside(aside, "empresas")
asideToggle(aside)


const urlParams = new URLSearchParams(window.location.search)
const location = urlParams.has("localizacao") ? urlParams.get("localizacao") : ""
const company = urlParams.has("nome") ? urlParams.get("nome") : ""

const response = await fetch(`http://localhost:8000/empresas?nome=${company}&localizacao=${location}`)
const data = await response.json()

const page = urlParams.get("page")
const size = data.empresas.length
const numberOfPages = Math.ceil(size / 10);

createRemoveFilterButton()

populateTable(page, data.empresas, numberOfPages, size)

buttonFunctionality(page, numberOfPages, urlParams)

inputFunctionality(urlParams)
