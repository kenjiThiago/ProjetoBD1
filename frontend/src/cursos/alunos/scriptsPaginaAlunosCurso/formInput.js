export function inputFunctionality(urlParams) {
  const inputNomeAluno = document.querySelector("form input[name='aluno']")
  const inputYear = document.querySelector("form input[name=ano_conclusao]")

  const nameA = urlParams.get("aluno")
  const year = urlParams.get("ano_conclusao")

  inputNomeAluno.value = nameA !== null ? nameA : ""
  inputYear.value = year !== null ? year : ""
}

