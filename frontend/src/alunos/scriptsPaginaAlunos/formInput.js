export function inputFunctionality(urlParams) {
  const inputName = document.querySelector("form input[name='nome']")
  const selectStatus = document.querySelector("form select[name='status_plano']")

  const nameA = urlParams.get("nome")
  const status = urlParams.get("status_plano")

  inputName.value = nameA !== null ? nameA : ""
  selectStatus.value = status !== null ? status : ""
}
