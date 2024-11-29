export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='vaga']")
  const inputCompany = document.querySelector("form input[name='empresa']")
  const inputLocation = document.querySelector("form input[name='localizacao']")
  const inputRequisito = document.querySelector("form input[name='requisito']")

  const nameV = urlParams.get("vaga")
  const company = urlParams.get("empresa")
  const location = urlParams.get("localizacao")
  const requisito = urlParams.get("requisito")

  inputName.value = nameV !== null ? nameV : ""
  inputCompany.value = company !== null ? company : ""
  inputLocation.value = location !== null ? location : ""
  inputRequisito.value = requisito !== null ? requisito : ""
}
