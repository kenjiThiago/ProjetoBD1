import logo from "../../assets/logo.png"
import menu from "../../assets/menu.svg"

document.querySelector("#app header").innerHTML = `
<div id="header-wrapper">
  <div id="menu-wrapper">
    <img src="${menu}" alt="" id="toggle-aside" />
  </div>

  <a href="/" id="logo">
    <img src="${logo}" alt="Logo da Marca" />
    <h2>Escola de Programação</h2>
  </a>
</div>
`
