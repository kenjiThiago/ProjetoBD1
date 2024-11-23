export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='vaga']")
  const inputCompany = document.querySelector("form input[name='empresa']")

  const nameV = urlParams.get("vaga")
  const company = urlParams.get("empresa")

  inputName.value = nameV !== null ? nameV : ""
  inputCompany.value = company !== null ? company : ""
}
