import { defineConfig } from "vite";
import melangePlugin from "vite-plugin-melange";

export default defineConfig({
  plugins: [
    melangePlugin({
      emitDir: "src",
      buildCommand: "opam exec -- dune build @3-vite",
      watchCommand: "opam exec -- dune build --watch @3-vite",
    }),
  ],
  server: {
    watch: {
      awaitWriteFinish: {
        stabilityThreshold: 500,
        pollInterval: 20,
      },
    },
  },
});
