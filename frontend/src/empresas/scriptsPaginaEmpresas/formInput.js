export function inputFunctionality(urlParams) {
  const inputCompany = document.querySelector("form input[name='nome']")
  const inputLocation = document.querySelector("form input[name='localizacao']")
  const inputSector = document.querySelector("form input[name='setor']")

  const nameC = urlParams.get("nome")
  const locationC = urlParams.get("localizacao")
  const sector = urlParams.get("setor")

  inputLocation.value = locationC !== null ? locationC : ""
  inputCompany.value = nameC !== null ? nameC : ""
  inputSector.value = sector !== null ? sector : ""
}
