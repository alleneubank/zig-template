# zig-template

Zig project template with agentic-first tooling, a locked mise toolchain, and CI.

**[SETUP.md](SETUP.md)** — step-by-step instructions to create a new project from this template.

## Features

- **Zig 0.17.0** via [mise](https://mise.jdx.dev)
- **ziglint** static analysis (prebuilt binary)
- **zigdocs** via built-in autodoc (`zig build docs`)
- **lefthook** git hooks (format, lint, test)
- **GitHub Actions** CI (test, lint, fmt, docs)
- **mise** toolchain pinned in `mise.toml` with per-platform checksums in `mise.lock`
- **CLAUDE.md** + **AGENTS.md** for AI-assisted development

## Quick Start

```bash
mise install --locked   # install pinned tools (zig, ziglint, lefthook, jq, ripgrep)
zig build          # build library + executable
zig build run      # run the executable
zig build test     # run all tests
zig build docs     # generate documentation
zig build fmt      # check formatting
ziglint            # run linter
lefthook install   # setup git hooks
```

## Project Structure

```
src/
  root.zig         # Library public API
  main.zig         # Executable entry point
build.zig          # Build script
build.zig.zon      # Package manifest
.ziglint.zon       # Linter config
mise.toml          # Toolchain pins
mise.lock          # Locked tool URLs and checksums
CLAUDE.md          # AI agent instructions
AGENTS.md          # -> CLAUDE.md (symlink)
SETUP.md           # Template setup guide (delete after use)
```

## Requirements

- [mise](https://mise.jdx.dev/getting-started.html)
- Optional: [direnv](https://direnv.net) — `.envrc` activates the mise toolchain (`direnv allow`)

Without direnv, activate mise in your shell or prefix commands with `mise exec --`.

## License

MIT
