export function buttonFunctionality(page, numberOfPages, urlParams) {
  const forward = document.querySelector("#forward")

  if (page == numberOfPages) {
    forward.toggleAttribute("disabled", "disabled")
    forward.style.opacity = "0.5"
  } else {
    forward.addEventListener("click", () => {
      urlParams.set("page", Number(page) + 1)
      window.location.search = urlParams
    })
  }

  const backward = document.querySelector("#backward")

  if (page == 1) {
    backward.toggleAttribute("disabled", "disabled")
    backward.style.opacity = "0.5"
  } else {
    backward.addEventListener("click", () => {
      urlParams.set("page", Number(page) - 1)
      window.location.search = urlParams
    })
  }
}
