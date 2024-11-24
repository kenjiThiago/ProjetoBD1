import "./styles/main.css"
import "./styles/cards.css"

import { createHeader } from "./scripts/components/header.js"
import { createAside } from "./scripts/components/aside.js"
import { asideToggle } from "./scripts/functionalities/header.js"
import { createDashboard } from "./scriptsPaginaInicial/dashboard.js"

const aside = document.querySelector("#app aside")

createHeader("Dashboard")
createAside(aside, "inicio")
asideToggle(aside)

createDashboard()
