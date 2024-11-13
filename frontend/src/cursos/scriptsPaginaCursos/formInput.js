export function inputFunctionality(urlParams) {
  const inputCurso = document.querySelector("form input[name='nomeC']")

  const nomeC = urlParams.get("nomeC")

  inputCurso.value = nomeC !== null ? nomeC : ""
}
