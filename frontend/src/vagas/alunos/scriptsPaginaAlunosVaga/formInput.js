export function inputFunctionality(urlParams) {
  const inputNomeAluno = document.querySelector("form input[name='nome']")
  const qualificadoSelect = document.querySelector("form select[name='qualificacao']")

  const nameA = urlParams.get("nome")
  const qualification = urlParams.get("qualificacao")

  inputNomeAluno.value = nameA !== null ? nameA : ""
  qualificadoSelect.value = qualification !== null ? qualification : ""
}
