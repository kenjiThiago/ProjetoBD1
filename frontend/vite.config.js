import { resolve } from "path"

export default {
  root: "src",
  build: {
    rollupOptions: {
      input: {
        main: resolve(__dirname, "src/index.html"),
        vagas: resolve(__dirname, "src/vagas/index.html"),
        alunosInscritos: resolve(__dirname, "src/vagas/alunosInscritos/index.html"),
        cursos: resolve(__dirname, "src/cursos/index.html"),
        alunosCurso: resolve(__dirname, "src/cursos/alunos/index.html"),
        empresas: resolve(__dirname, "src/empresas/index.html"),
        vagasEmpresa: resolve(__dirname, "src/empresas/vagas/index.html"),
        alunos: resolve(__dirname, "src/alunos/index.html"),
        vagasAluno: resolve(__dirname, "src/alunos/vagas/index.html"),
        cursosNecessarios: resolve(__dirname, "src/alunos/vagas/cursos/index.html"),
        dashboardAluno: resolve(__dirname, "src/dashboardAluno/index.html"),
      },
    }
  },
}
