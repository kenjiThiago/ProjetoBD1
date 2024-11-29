import "../../scripts/functionalities/font.js"
import "../../styles/main.css"
import "../../styles/table.css"

import { createHeader } from "../../scripts/components/header.js"
import { createAside } from "../../scripts/components/aside.js"
import { asideToggle } from "../../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../../scripts/functionalities/removeFilters.js"
import { inputFunctionality } from "./scriptsVagasAluno/formInput.js"
import { createTable } from "./scriptsVagasAluno/tablePaginaVagasAluno.js"
import { createOrderingButton } from "../../scripts/functionalities/orderingButton.js"

const aside = document.querySelector("#app aside")

createHeader("Vagas Inscritas")
createAside(aside, "alunos")
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)
const email = urlParams.has("email_aluno") ? urlParams.get("email_aluno") : ""

const form = document.querySelector("form")
form.innerHTML += `<input name="email_aluno" value="${email}" hidden>`

createRemoveFilterButton()
createOrderingButton(urlParams)
inputFunctionality(urlParams)
createTable(urlParams)
