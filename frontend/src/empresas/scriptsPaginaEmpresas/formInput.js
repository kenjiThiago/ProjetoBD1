export function inputFunctionality(urlParams) {
  const inputCompany = document.querySelector("form input[name='nome']")
  const inputLocation = document.querySelector("form input[name='localizacao']")

  const nameC = urlParams.get("nome")
  const locationC = urlParams.get("localizacao")

  inputLocation.value = locationC !== null ? locationC : ""
  inputCompany.value = nameC !== null ? nameC : ""
}
