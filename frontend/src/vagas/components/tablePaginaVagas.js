export function populateTable(page, data, numberOfPages, size) {
  const total = document.querySelector("#table-footer p")
  const pages = document.querySelector("#pages p")

  total.innerHTML = `Número de vagas: ${size}`
  pages.innerHTML = `Página ${Number(page)} de ${numberOfPages}`

  const tableBody = document.querySelector("#content tbody")

  for (let i = (page - 1) * 10; i < size && i < 10 * page; i++) {
    const row = `
      <tr data-href="/vagas/?id=${data[i].id}">
        <td>${data[i].name}</td>
        <td>${data[i].empresa}</td>
        <td>${data[i].inscritos}</td>
        <td>${data[i].localizacao}</td>
        <td>${data[i].requisitos}</td>
      </tr>
    `

    tableBody.innerHTML += row;
  }

  const rows = document.querySelectorAll("tr[data-href]")

  rows.forEach(row => {
    row.addEventListener("click", () => {
      window.location.href = row.dataset.href;
    })
  })
}