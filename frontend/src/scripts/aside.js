import "../styles/aside.css"
import "../styles/header.css"

const img = document.querySelector("#toggle-aside")

const aside = document.querySelector("#app aside")
const app = document.querySelector("#app")

aside.style.left = "-20rem"

img.addEventListener("click", () => {
aside.style.left = "0"
  aside.classList.toggle("hide")

  app.classList.toggle("expand")

  img.classList.toggle("rotate")

  if (img.classList.contains("rotate")) {
    img.src = "../assets/close.svg"
  } else {
    img.src = "../assets/menu.svg"
  }
})
