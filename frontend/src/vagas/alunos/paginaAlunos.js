import "../../styles/main.css"
import "../../styles/table.css"

import { createHeader } from "../../scripts/components/header.js"
import { createAside } from "../../scripts/components/aside.js"
import { asideToggle } from "../../scripts/functionalities/header.js"

const aside = document.querySelector("#app aside")

createHeader("Alunos Inscritos")
createAside(aside, "vagas")
asideToggle(aside)
