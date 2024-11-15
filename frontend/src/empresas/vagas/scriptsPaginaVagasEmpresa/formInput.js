export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  //const inputLocation = document.querySelector("form input[name='localizacao']")

  const nameV = urlParams.get("nome")
  const location = urlParams.get("localizacao")

  inputName.value = nameV !== null ? nameV : ""
  //inputLocation.value = location !== null ? location : ""
}
