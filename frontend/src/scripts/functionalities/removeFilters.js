export function createRemoveFilterButton() {
  const button = document.querySelector("#remove-filters")
  const form = document.querySelector("form")

  button.addEventListener("click", () => {
    form.reset()
  })
}
