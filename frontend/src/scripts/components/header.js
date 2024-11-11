import "../../styles/header.css"

import logo from "../../assets/logo.png"
import menu from "../../assets/menu.svg"

export function createHeader(pageTitle) {
  document.querySelector("#app header").innerHTML = `
    <div id="header-wrapper">
      <div id="menu-wrapper">
        <img src="${menu}" alt="" id="toggle-aside" />
        <h1>${pageTitle}</h1>
      </div>

      <a href="/" id="logo">
        <img src="${logo}" alt="Logo da Marca" />
        <h1>Codify</h1>
      </a>
    </div>
  `
}
