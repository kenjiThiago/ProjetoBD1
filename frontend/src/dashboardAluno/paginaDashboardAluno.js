import "../scripts/functionalities/font.js"
import "../styles/main.css"
import "../styles/cards.css"
import "../styles/dashboardAluno.css"
import "../styles/table.css"

import { createHeader } from "../scripts/components/header.js"
import { createAside } from "../scripts/components/aside.js"
import { asideToggle } from "../scripts/functionalities/header.js"
import { createRemoveFilterButton } from "../scripts/functionalities/removeFilters.js"
import { createDashboard } from "./scriptsPaginaDashboardAluno/dashboard.js"
import { inputFunctionality } from "./scriptsPaginaDashboardAluno/formInput.js"

const aside = document.querySelector("#app aside")

createHeader("Informações do Aluno")
createAside(aside)
asideToggle(aside)

const urlParams = new URLSearchParams(window.location.search)
const email = urlParams.has("email") ? urlParams.get("email") : ""

const form = document.querySelector("form")
form.innerHTML += `<input name="email" value="${email}" hidden>`

createDashboard(urlParams)
inputFunctionality(urlParams)

createRemoveFilterButton()
