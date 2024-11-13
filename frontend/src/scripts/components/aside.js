import "../../styles/aside.css"

import logo from "../../assets/logo.png"
import inicio from "../../assets/inicio.svg"
import vagas from "../../assets/vagas.svg"
import cursos from "../../assets/cursos.svg"
import empresas from "../../assets/empresas.svg"
import alunos from "../../assets/alunos.svg"

export function createAside(aside, id) {
  aside.innerHTML = `
    <img src="${logo}" alt="Logo da Marca" />
    <a href="/" id="inicio">
      <img src="${inicio}" alt="">
      <span>Inicio</span>
    </a>
    <a href="/vagas/?page=1" id="vagas">
      <img src="${vagas}" alt="">
      <span>Vagas</span>
    </a>
    <a href="/cursos/?page=1" id="cursos">
      <img src="${cursos}" alt="">
      <span>Cursos</span>
    </a>
    <a href="/empresas/?page=1" id="empresas">
      <img src="${empresas}" alt="">
      <span>Empresas</span>
    </a>
    <a href="#" id="alunos">
      <img src="${alunos}" alt="">
      <span>Alunos</span>
    </a>
  `

  const a = aside.querySelector(`#${id}`)
  if (a !== null) a.classList.add("active")
}
