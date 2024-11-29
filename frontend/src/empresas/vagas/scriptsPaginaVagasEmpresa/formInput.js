export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  const inputRequiriment = document.querySelector("form input[name='requisito']")

  const nameV = urlParams.get("nome")
  const requiriment = urlParams.get("requisito")

  inputName.value = nameV !== null ? nameV : ""
  inputRequiriment.value = requiriment !== null ? requiriment : ""
}
