export function createRemoveFilterButton() {
  const button = document.querySelector("main form button:nth-last-child(1)")
  const form = document.querySelector("form")

  button.addEventListener("click", () => {
    form.reset()
  })
}
