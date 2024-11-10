import { resolve } from "path"

export default {
  root: "src",
  build: {
    target: 'esnext',
    rollupOptions: {
      input: {
        main: resolve(__dirname, "src/index.html"),
        vagas: resolve(__dirname, "src/vagas/index.html"),
      },
    }
  },
}
