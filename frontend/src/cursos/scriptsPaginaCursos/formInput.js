export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")

  const nameC = urlParams.get("nome")

  inputName.value = nameC !== null ? nameC : ""
}
