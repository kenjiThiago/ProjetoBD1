export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  const selectLevel = document.querySelector("form select[name='nivel']")

  const nameC = urlParams.get("nome")
  const level = urlParams.get("nivel")

  inputName.value = nameC !== null ? nameC : ""
  selectLevel.value = level !== null ? level : ""
}
