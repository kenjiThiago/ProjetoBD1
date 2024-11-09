import "../styles/main.css"
import "../styles/paginaInicial.css"
import Chart from "chart.js/auto"
import ChartDataLabels from "chartjs-plugin-datalabels"

(async function() {
  const ctx = document.getElementById("acquisitions")

  const options = {
    type: "doughnut",
    data: {
      labels: [
        "Ativo",
        "Inativo",
      ],
      datasets: [{
        label: "Alunos",
        data: [150, 50],
        backgroundColor: [
          "#1D2C45",
          "#E65A00",
        ],
        hoverOffset: 4,
      }],
    },
    options: {
      layout: {
        padding: 20
      },
      plugins: {
        legend: {
          labels: {
            color: "#000000",
            font: {
              size: 14,
              weight: 'bold'
            },
          },
        },
        datalabels: {
          color: "#000000",
          font: {
            size: 14,
          },
          anchor: 'end',
          align: 'end',
          formatter: ((value, ctx) => {
            const totalSum = ctx.dataset.data.reduce((accumulator, currentValue) => {
              return accumulator + currentValue
            }, 0)

            const percentage = value / totalSum * 100
            return `${value} (${percentage.toFixed(1)}%)`
          })
        },
      },
    },
    plugins: [ChartDataLabels],
  }

  new Chart(ctx, options)
})()
