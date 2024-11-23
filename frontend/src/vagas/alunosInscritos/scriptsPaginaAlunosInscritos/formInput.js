export function inputFunctionality(urlParams) {
  const inputNomeAluno = document.querySelector("form input[name='aluno']")
  const qualificadoSelect = document.querySelector("form select[name='qualificacao']")

  const nameA = urlParams.get("aluno")
  const qualification = urlParams.get("qualificacao")

  inputNomeAluno.value = nameA !== null ? nameA : ""
  qualificadoSelect.value = qualification !== null ? qualification : ""
}
