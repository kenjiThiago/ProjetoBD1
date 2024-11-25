import "../../scripts/functionalities/font.js"
import "../../styles/main.css"
import "../../styles/table.css"

import { createHeader } from "../../scripts/components/header.js"
import { createAside } from "../../scripts/components/aside.js"
import { asideToggle } from "../../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../../scripts/functionalities/removeFilters.js"
import { inputFunctionality } from "./scriptsPaginaAlunosInscritos/formInput.js"
import { createTable } from "./scriptsPaginaAlunosInscritos/tableAlunosInscritos.js"

const aside = document.querySelector("#app aside")

createHeader("Alunos Inscritos")
createAside(aside, "vagas")
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)
const idV = urlParams.has("id_vaga") ? urlParams.get("id_vaga") : ""

const form = document.querySelector("form")
form.innerHTML += `<input name="id_vaga" value="${idV}" hidden>`

createRemoveFilterButton()
inputFunctionality(urlParams)
createTable(urlParams)
