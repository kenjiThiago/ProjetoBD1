import logo from "../../assets/logo.png"
import inicio from "../../assets/inicio.svg"
import vagas from "../../assets/vagas.svg"
import cursos from "../../assets/cursos.svg"
import empresas from "../../assets/empresas.svg"
import alunos from "../../assets/alunos.svg"
import menu from "../../assets/menu.svg"
import close from "../../assets/close.svg"

import "../../styles/aside.css"
import "../../styles/header.css"

const aside = document.querySelector("#app aside")

aside.innerHTML = `
<img src="${logo}" alt="Logo da Marca" />
<a href="/">
  <img src="${inicio}" alt="">
  <span>Inicio</span>
</a>
<a href="/vagas/">
  <img src="${vagas}" alt="">
  <span>Vagas</span>
</a>
<a href="#">
  <img src="${cursos}" alt="">
  <span>Cursos</span>
</a>
<a href="#">
  <img src="${empresas}" alt="">
  <span>Empresas</span>
</a>
<a href="#">
  <img src="${alunos}" alt="">
  <span>Alunos</span>
</a>
`
const url = new URL(window.location)
const a = aside.querySelector(`a[href='${url.pathname}']`)
a.classList.add("active")

const img = document.querySelector("#toggle-aside")

const app = document.querySelector("#app")

aside.style.left = "-20rem"

img.addEventListener("click", () => {
aside.style.left = "0"
  aside.classList.toggle("hide")

  app.classList.toggle("expand")

  img.classList.toggle("rotate")

  if (img.classList.contains("rotate")) {
    img.src = close
  } else {
    img.src = menu
  }
})
