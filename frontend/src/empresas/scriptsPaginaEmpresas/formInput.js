export function inputFunctionality(urlParams) {
  const inputCompany = document.querySelector("form input[name='nome']")
  const inputLocation = document.querySelector("form input[name='localizacao']")

  const nameC = urlParams.get("nome")
  const location = urlParams.get("localizacao")

  inputLocation.value = location !== null ? location : ""
  inputCompany.value = nameC !== null ? nameC : ""
}
