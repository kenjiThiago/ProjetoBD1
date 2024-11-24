import Chart from "chart.js/auto"
import ChartDataLabels from "chartjs-plugin-datalabels"

const legendMargin = {
  id: "legendMargin",
  afterInit(chart) {
    const originalFit = chart.legend.fit
    chart.legend.fit = function fit() {
      if (originalFit) {
        originalFit.call(this)
      }
      return this.height += 30
    }
  }
}

export function statusGraph(num_alunos_ativos, num_alunos_inativos) {
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
        padding: 80
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
          padding: 40,
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
    plugins: [ChartDataLabels, legendMargin],
  }

  new Chart(ctx, options)
}

export function courseGraph(cursosConcluidos, cursosNaoConcluidos) {
  const ctx = document.getElementById("acquisitions")

  const options = {
    type: "pie",
    data: {
      labels: [
        "concluidos",
        "não concluidos",
      ],
      datasets: [{
        label: "Cursos",
        data: [cursosConcluidos, cursosNaoConcluidos],
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
        padding: 80
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
    plugins: [ChartDataLabels, legendMargin],
  }

  new Chart(ctx, options)
}
