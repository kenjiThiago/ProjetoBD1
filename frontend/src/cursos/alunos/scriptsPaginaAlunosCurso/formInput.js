export function inputFunctionality(urlParams) {
  const inputNomeAluno = document.querySelector("form input[name='aluno']")
  const inputYear = document.querySelector("form input[name=ano_conclusao]")
  const inputYearEnd = document.querySelector("form input[name=ano_conclusao_ate]")

  const nameA = urlParams.get("aluno")
  const year = urlParams.get("ano_conclusao")
  const yearEnd = urlParams.get("ano_conclusao_ate")

  inputNomeAluno.value = nameA !== null ? nameA : ""
  inputYear.value = year !== null ? year : ""
  inputYearEnd.value = yearEnd !== null ? yearEnd : ""
}

