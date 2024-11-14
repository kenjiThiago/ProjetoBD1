export function populateTable(page, data, numberOfPages, size) {
  const total = document.querySelector("#table-footer p")
  const pages = document.querySelector("#pages p")

  total.innerHTML = `Número de Alunos: ${size}`

  if (size == 0) {
    pages.innerHTML = `Nenhuma Página`
    const tableWrapper = document.querySelector("#table-wrapper")
    tableWrapper.innerHTML += `
      <h1>Nenhum Aluno Encontrado</h1>
    `

    return
  }

  pages.innerHTML = `Página ${size != 0 ? Number(page) : 0} de ${numberOfPages}`

  const tableBody = document.querySelector("#content tbody")

  for (let i = (page - 1) * 10; i < size && i < 10 * page; i++) {
    const row = `
      <tr data-href="/vagas/alunos/?id=${data[i].id}&page=1">
        <td>${data[i].name}</td>
        <td>${data[i].email}</td>
        <td>${data[i].num_cursos}</td>
        <td>${data[i].habilidades}</td>
      </tr>
    `

    tableBody.innerHTML += row;
  }

  //const rows = document.querySelectorAll("tr[data-href]")
  //
  //rows.forEach(row => {
  //  row.addEventListener("click", () => {
  //    window.location.href = row.dataset.href;
  //  })
  //})
}
