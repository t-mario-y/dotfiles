import { serveDir } from "jsr:@std/http/file-server";

// PORT=3001 SERVE_DIR=coverage deno run --allow-all ~/dotfiles/utils/serve_dir.ts
const dir = Deno.env.get("SERVE_DIR");
Deno.serve(
  { port: parseInt(Deno.env.get("PORT") || "3001") },
  (req: Request) => {
    const pathname = new URL(req.url).pathname;
    if (pathname.startsWith(`/${dir}`)) {
      return serveDir(req, {
        fsRoot: dir,
        urlRoot: dir,
      });
    }
    return new Response("404: Not Found", {
      status: 404,
    });
  },
);
