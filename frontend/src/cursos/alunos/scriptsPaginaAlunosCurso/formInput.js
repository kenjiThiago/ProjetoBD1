export function inputFunctionality(urlParams) {
  const inputNomeAluno = document.querySelector("form input[name='nome']")

  const nameA = urlParams.get("nome")

  inputNomeAluno.value = nameA !== null ? nameA : ""
}

