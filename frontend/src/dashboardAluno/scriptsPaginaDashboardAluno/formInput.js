export function inputFunctionality(urlParams) {
  const inputCourse = document.querySelector("form input[name='curso']")
  const inputSkills = document.querySelector("form input[name='habilidade']")
  const selectLevel = document.querySelector("form select[name='nivel']")

  const course = urlParams.get("curso")
  const skills = urlParams.get("habilidade")
  const level = urlParams.get("nivel")

  inputCourse.value = course !== null ? course : ""
  inputSkills.value = skills !== null ? skills : ""
  selectLevel.value = level !== null ? level : ""
}
