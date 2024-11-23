import "../../styles/main.css"
import "../../styles/table.css"

import { createHeader } from "../../scripts/components/header.js"
import { createAside } from "../../scripts/components/aside.js"
import { asideToggle } from "../../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../../scripts/functionalities/removeFilters.js"
import { inputFunctionality } from "./scriptsPaginaAlunosVaga/formInput.js"
import { createTable } from "./scriptsPaginaAlunosVaga/tablePaginaAlunosVaga.js"

const aside = document.querySelector("#app aside")

createHeader("Alunos Inscritos")
createAside(aside, "vagas")
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)
const idV = urlParams.has("id") ? urlParams.get("id") : ""

const form = document.querySelector("form")
form.innerHTML += `<input name="id" value="${idV}" hidden>`

createRemoveFilterButton()
inputFunctionality(urlParams)
createTable(urlParams)
