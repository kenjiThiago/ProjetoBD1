import "../../styles/aside.css"

import logo from "../../assets/logo.png"
import inicio from "../../assets/inicio.svg"
import vagas from "../../assets/vagas.svg"
import cursos from "../../assets/cursos.svg"
import empresas from "../../assets/empresas.svg"
import alunos from "../../assets/alunos.svg"

export function createAside(aside) {
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
}
