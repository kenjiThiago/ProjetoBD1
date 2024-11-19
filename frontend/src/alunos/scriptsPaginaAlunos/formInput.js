export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  const selectStatus = document.querySelector("form select[name='status_plano']")

  const nameA = urlParams.get("nome")
  const qualification = urlParams.get("status_plano")

  inputName.value = nameA !== null ? nameA : ""
  selectStatus.value = qualification !== null ? qualification : ""
}
