export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  const inputCompany = document.querySelector("form input[name='empresa']")
  const inputLocation = document.querySelector("form input[name='localizacao']")
  const inputRequiriment = document.querySelector("form input[name='requisito']")

  const nameV = urlParams.get("nome")
  const company = urlParams.get("empresa")
  const locationV = urlParams.get("localizacao")
  const requiriment = urlParams.get("requisito")

  inputName.value = nameV !== null ? nameV : ""
  inputCompany.value = company !== null ? company : ""
  inputLocation.value = locationV !== null ? locationV : ""
  inputRequiriment.value = requiriment !== null ? requiriment : ""
}
