import "../../styles/main.css"
import "../../styles/table.css"

import { createHeader } from "../../scripts/components/header.js"
import { createAside } from "../../scripts/components/aside.js"
import { asideToggle } from "../../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../../scripts/functionalities/removeFilters.js"
import { inputFunctionality } from "./scriptsPaginaVagasEmpresa/formInput.js"
import { createTable } from "./scriptsPaginaVagasEmpresa/tablePaginaVagasEmpresa.js"

const aside = document.querySelector("#app aside")

createHeader("Vagas da Empresa")
createAside(aside, "empresas")
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)
const nameC = urlParams.has("empresa_nome") ? urlParams.get("empresa_nome") : ""

const form = document.querySelector("form")
form.innerHTML += `<input name="empresa_nome" value="${nameC}" hidden>`

createRemoveFilterButton()
inputFunctionality(urlParams)
createTable(urlParams)
