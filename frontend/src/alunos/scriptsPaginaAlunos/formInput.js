export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  const selectStatus = document.querySelector("form select[name='status']")

  const nameA = urlParams.get("nome")
  const qualification = urlParams.get("status")

  inputName.value = nameA !== null ? nameA : ""
  selectStatus.value = qualification !== null ? qualification : ""
}
