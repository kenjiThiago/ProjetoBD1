export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  const selectLevel = document.querySelector("form select[name='nivel']")
  const inputHabilidade = document.querySelector("form input[name='habilidade']")

  const nameC = urlParams.get("nome")
  const level = urlParams.get("nivel")
  const habilidade = urlParams.get("habilidade")

  inputName.value = nameC !== null ? nameC : ""
  selectLevel.value = level !== null ? level : ""
  inputHabilidade.value = habilidade !== null ? habilidade : ""
}
