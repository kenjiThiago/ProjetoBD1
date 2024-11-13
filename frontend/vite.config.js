import { resolve } from "path"

export default {
  root: "src",
  build: {
    target: 'esnext',
    rollupOptions: {
      input: {
        main: resolve(__dirname, "src/index.html"),
        vagas: resolve(__dirname, "src/vagas/index.html"),
        alunos: resolve(__dirname, "src/vagas/alunos/index.html"),
        cursos: resolve(__dirname, "src/cursos/index.html")
      },
    }
  },
}
