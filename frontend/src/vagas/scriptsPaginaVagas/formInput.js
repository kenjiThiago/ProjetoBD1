export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  const inputCompany = document.querySelector("form input[name='empresa']")

  const name = urlParams.get("nome")
  const company = urlParams.get("empresa")

  inputName.value = name !== null ? name : ""
  inputCompany.value = company !== null ? company : ""
}
