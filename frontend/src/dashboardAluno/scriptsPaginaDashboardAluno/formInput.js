export function inputFunctionality(urlParams) {
  const inputCourse = document.querySelector("form input[name='curso']")
  const inputSkills = document.querySelector("form input[name='habilidade']")

  const course = urlParams.get("curso")
  const skills = urlParams.get("habilidade")

  inputCourse.value = course !== null ? course : ""
  inputSkills.value = skills !== null ? skills : ""
}
