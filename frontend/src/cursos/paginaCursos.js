import "../styles/main.css"
import "../styles/table.css"

import { populateTable } from "./scriptsPaginaCursos/tablePaginaCursos.js"
import { buttonFunctionality } from "../scripts/functionalities/tableButtons.js"
import { inputFunctionality } from "./scriptsPaginaCursos/formInput.js"
import { createHeader } from "../scripts/components/header.js"
import { createAside } from "../scripts/components/aside.js"
import { asideToggle } from "../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../scripts/functionalities/removeFilters.js"

const aside = document.querySelector("#app aside")

createHeader("Cursos Disponíveis")
createAside(aside, "cursos")
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)
const nameC = urlParams.has("nomeC") ? urlParams.get("nomeC") : ""

const response = await fetch(`http://localhost:8000/cursos?nome=${nameC}`)
const data = await response.json()

const page = urlParams.get("page")
const size = data.cursos.length
const numberOfPages = Math.ceil(size / 10);

createRemoveFilterButton()

populateTable(page, data.cursos, numberOfPages, size)

buttonFunctionality(page, numberOfPages, urlParams)

inputFunctionality(urlParams)
