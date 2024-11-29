export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='curso_nome']")
  const inputSkill = document.querySelector("form input[name='habilidade']")
  const selectLevel = document.querySelector("form select[name='nivel']")

  const nameC = urlParams.get("curso_nome")
  const level = urlParams.get("nivel")
  const skill = urlParams.get("habilidade")

  inputName.value = nameC !== null ? nameC : ""
  inputSkill.value = skill !== null ? skill : ""
  selectLevel.value = level !== null ? level : ""
}
