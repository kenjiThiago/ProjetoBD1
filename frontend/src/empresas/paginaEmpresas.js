import "../styles/main.css"
import "../styles/table.css"

import { createHeader } from "../scripts/components/header"
import { createAside } from "../scripts/components/aside"
import { asideToggle } from "../scripts/functionalities/header"
import { createRemoveFilterButton } from "../scripts/functionalities/removeFilters"
import { inputFunctionality } from "./scriptsPaginaEmpresas/formInput"
import { createTable } from "./scriptsPaginaEmpresas/tablePaginaEmpresas"

const aside = document.querySelector("#app aside")

createHeader("Empresas Parceiras")
createAside(aside, "empresas")
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)

createRemoveFilterButton()
inputFunctionality(urlParams)
createTable(urlParams)
