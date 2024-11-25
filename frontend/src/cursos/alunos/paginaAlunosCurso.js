import "../../scripts/functionalities/font.js"
import "../../styles/main.css"
import "../../styles/table.css"

import { createHeader } from "../../scripts/components/header.js"
import { createAside } from "../../scripts/components/aside.js"
import { asideToggle } from "../../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../../scripts/functionalities/removeFilters.js"
import { inputFunctionality } from "./scriptsPaginaAlunosCurso/formInput.js"
import { createTable } from "./scriptsPaginaAlunosCurso/tablePaginaAlunosCurso.js"

const aside = document.querySelector("#app aside")

createHeader("Alunos Formados")
createAside(aside, "cursos")
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)
const nameC = urlParams.has("nomeC") ? urlParams.get("nomeC") : ""

const form = document.querySelector("form")
form.innerHTML += `<input name="nomeC" value="${nameC}" hidden>`

createRemoveFilterButton()
inputFunctionality(urlParams)
createTable(urlParams)
