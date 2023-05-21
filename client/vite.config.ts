import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { viteStaticCopy } from "vite-plugin-static-copy";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    viteStaticCopy({
      targets: [
        {
          src: "./public/**/*",
          dest: "./static",
          // dest: "../server/templates/client/static",
        },
      ],
    }),
  ],
  publicDir: "../server/static",
  build: {
    emptyOutDir: true,
    outDir: "../server/templates/client",
    assetsDir: "static",
    copyPublicDir: false,
  },
});
