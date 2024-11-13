export function inputFunctionality(urlParams) {
  const inputCompany = document.querySelector("form input[name='empresa']")
  const inputLocation = document.querySelector("form input[name='localizacao']")

  const company = urlParams.get("empresa")
  const location = urlParams.get("localizacao")

  inputLocation.value = location !== null ? location : ""
  inputCompany.value = company !== null ? company : ""
}
