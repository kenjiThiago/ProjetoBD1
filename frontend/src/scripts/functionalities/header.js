import menu from "../../assets/menu.svg"
import close from "../../assets/close.svg"

export function asideToggle(aside) {
  const img = document.querySelector("#toggle-aside")
  const app = document.querySelector("#app")
  const menuWrapper = document.querySelector("#menu-wrapper")

  aside.style.left = "-20rem"

  img.addEventListener("click", () => {
    aside.style.left = "0"
    aside.classList.toggle("hide")

    app.classList.toggle("expand")

    img.classList.toggle("rotate")

    menuWrapper.classList.toggle("shift-left")

    if (img.classList.contains("rotate")) {
      img.src = close
    } else {
      img.src = menu
    }
  })
}
