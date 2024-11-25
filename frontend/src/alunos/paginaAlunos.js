import "../scripts/functionalities/font.js"
import "../styles/main.css"
import "../styles/table.css"

import { createHeader } from "../scripts/components/header.js"
import { createAside } from "../scripts/components/aside.js"
import { asideToggle } from "../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../scripts/functionalities/removeFilters.js"
import { inputFunctionality } from "./scriptsPaginaAlunos/formInput.js"
import { createTable } from "./scriptsPaginaAlunos/tablePaginaAlunos.js"

const aside = document.querySelector("#app aside")

createHeader("Alunos Cadastrados")
createAside(aside, "alunos")
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)

createRemoveFilterButton()
inputFunctionality(urlParams)
createTable(urlParams)
