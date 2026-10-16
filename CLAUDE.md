# zig-template

Zig project template with agentic-first tooling.

## Quick Reference

- **Install tools:** `mise install --locked` (then `direnv allow` with .envrc, or prefix commands with `mise exec --`)
- **Build:** `zig build`
- **Run:** `zig build run`
- **Test:** `zig build test`
- **Format check:** `zig build fmt`
- **Lint:** `ziglint`
- **Generate docs:** `zig build docs` (output in `zig-out/docs/`)
- **All checks:** `zig build test && zig build fmt && ziglint`

## Project Layout

```
src/root.zig     # Library entry point (public API for consumers)
src/main.zig     # Executable entry point (imports library)
build.zig        # Build script (test, docs, fmt, run steps)
build.zig.zon    # Package manifest (name, version, deps)
.ziglint.zon     # Linter configuration
mise.toml        # Toolchain pins (Zig 0.17.0, ziglint, lefthook, jq, ripgrep)
mise.lock        # Locked tool URLs and checksums (`mise lock`)
```

## Build Steps

| Command | Description |
|---------|-------------|
| `zig build` | Build library and executable |
| `zig build run` | Run the executable |
| `zig build run -- args` | Run with arguments |
| `zig build test` | Run all unit tests |
| `zig build docs` | Generate autodoc HTML |
| `zig build fmt` | Check source formatting |

## Tooling

- **mise** — toolchain manager; `mise.toml` pins exact versions, `mise.lock` pins per-platform checksums for linux-x64, linux-arm64, macos-x64, macos-arm64
- **Zig** — stable 0.17.0 (mise core backend)
- **ziglint** — static analysis (prebuilt GitHub release; upstream ships no macos-x64 build)
- **lefthook** — git hooks (fmt, lint, test on pre-commit)
- **zig fmt** — canonical formatter (built into zig)

## Conventions

- Tests live alongside code in `test` blocks within `.zig` files
- Library public API is in `src/root.zig`; internal modules are separate `.zig` files imported with `@import`
- Use `std.log.scoped` for namespaced logging
- Pass allocators explicitly — never use global state for allocation
- Define explicit error sets — avoid `anyerror`
- Prefer `const` over `var`; prefer slices over raw pointers

## Template Usage

See [SETUP.md](SETUP.md) for step-by-step instructions to create a new project from this template. Delete `SETUP.md` after cutover.
