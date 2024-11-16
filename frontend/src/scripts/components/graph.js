import Chart from "chart.js/auto"
import ChartDataLabels from "chartjs-plugin-datalabels"

export function createGraph(num_alunos_ativos, num_alunos_inativos) {
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
        data: [num_alunos_ativos, num_alunos_inativos],
        //data: [10000, 10000],
        backgroundColor: [
          "#E65A00",
          "#1D2C45",
        ],
        hoverOffset: 4,
      }],
    },
    options: {
      layout: {
        padding: 90
      },
      plugins: {
        legend: {
          labels: {
            color: "#000000",
            font: {
              size: 20,
              weight: 'bold'
            },
          },
          reverse: true,
        },
        datalabels: {
          color: "#000000",
          font: {
            size: 20,
            weight: "bold",
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
}
