export function inputFunctionality(urlParams) {
  const inputNomeAluno = document.querySelector("form input[name='nomeA']")
  const qualificadoSelect = document.querySelector("form select[name='quali']")

  const nomeA = urlParams.get("nomeA")
  const quali = urlParams.get("quali")

  inputNomeAluno.value = nomeA !== null ? nomeA : ""
  qualificadoSelect.value = quali !== null ? quali : ""
}
