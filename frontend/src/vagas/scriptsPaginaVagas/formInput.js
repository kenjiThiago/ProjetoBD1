export function inputFunctionality(urlParams) {
  const inputVaga = document.querySelector("form input[name='nomeV']")
  const inputEmpresa = document.querySelector("form input[name='nomeE']")

  const nomeV = urlParams.get("nomeV")
  const nomeE = urlParams.get("nomeE")

  inputVaga.value = nomeV !== null ? nomeV : ""
  inputEmpresa.value = nomeE !== null ? nomeE : ""
}
