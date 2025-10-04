# Razor/CSHTML Formatter for Zed

A minimal Zed extension project scaffold that adds formatting support for ASP.NET Razor (`.razor`) and MVC Views (`.cshtml`) using Prettier + prettier-plugin-razor.

Status: initial scaffold. Formatting is provided via a Node shim invoked by the extension. Syntax highlighting is not yet implemented (uses HTML fallback if you configure language association).

## Features
- Format .razor and .cshtml files using Prettier's Razor plugin
- Basic language metadata for Razor and CSHTML (path associations)

## Requirements
- Node.js 18+ installed and available in PATH
- Zed 0.165+ (extensions API)

## Install deps
From the project root:

```sh
npm ci
```

This installs Prettier and the Razor plugin used by the formatter shim.

## Build/Load in Zed
This scaffold focuses on the formatter shim and language configs. If you want to experiment right away without building the Rust part:

1) In Zed, open Settings and associate file types if needed:
   - Add `.razor` and `.cshtml` to open as HTML temporarily for syntax highlighting.
2) Use the formatter CLI directly to test formatting (see below).

A proper Rust extension hook can be wired to run the formatter automatically in Zed. See Next Steps below.

## Try the formatter CLI
You can pipe a Razor/CSHTML file through the formatter shim:

```sh
node scripts/formatter/index.mjs --file-path sample.razor < sample.razor > formatted.razor
```

- Pass `--file-path` so Prettier can infer the parser from the filename.

## Project structure
- `languages/razor/config.toml` — Language metadata for `.razor`
- `languages/cshtml/config.toml` — Language metadata for `.cshtml`
- `scripts/formatter/index.mjs` — Node shim that runs Prettier with the Razor plugin
- `package.json` — Declares Prettier + prettier-plugin-razor
- `Cargo.toml`, `src/lib.rs`, `extension.toml` — Minimal Rust/Zed extension scaffold (formatter hook TODO)

## Next steps
- Wire the Rust extension to register a formatter for `Razor` and `CSHTML` languages and invoke the Node shim.
- Optionally integrate the official Razor Language Server for advanced features.
- Add Tree-sitter grammar and queries for proper syntax highlighting (if a stable grammar is available).

## License
MIT
