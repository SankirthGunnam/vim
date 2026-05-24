# Neovim cheat sheet (CoC)

**Leader:** `,` (comma) · Open this sheet: **`,?`** or **`:NvimCheatsheet`**

**Debugging** uses **nvim-dap** (maps below—need `lua/dap-setup.lua` loaded via `init.vim`).

## Why not Shift+C?

Normal-mode **`C`** (Shift+c) is built-in: **change text from cursor to end of line** (`c$`). Remapping it breaks standard Vim; use `,?` (`<leader>?`) instead.

## CoC — completion (insert mode)

| Key | Action |
|-----|--------|
| Tab | Next completion / indent |
| Shift+Tab | Previous completion |
| Enter | Confirm completion |
| Ctrl+Space | Refresh completions |

## CoC — LSP / diagnostics (normal)

| Key | Action |
|-----|--------|
| gd | Definition |
| gy | Type definition |
| gi | Implementation |
| gr | References |
| K | Hover docs |
| [g / ]g | Prev / next diagnostic |
| ,rn | Rename symbol |
| ,f | Format (selection or operator) |
| :CocFormat | Format whole buffer |

## Float scroll

| Key | Action |
|-----|--------|
| Ctrl+d / Ctrl+u | Scroll CoC float (else normal scroll) |

## Debugging (nvim-dap)

Pick a configuration when prompted (`:DapContinue` or map below). **Python** uses **debugpy** (`python3 -m debugpy`). **C/C++** uses **GDB 14+** DAP mode (`--interpreter=dap`); **`gdb-multiarch`** is used when installed (better for ARM/STM32 attach).

| Key | Action |
|-----|--------|
| ,dc | Continue / pick config & start |
| ,dC | Run last debug session |
| ,db | Toggle breakpoint |
| ,dB | Conditional breakpoint |
| ,dl | Clear breakpoints |
| ,dj | Step over |
| ,di | Step into |
| ,do | Step out |
| ,dr | Restart |
| ,dq | Terminate |
| ,du | Toggle **dap-ui** (scopes, stacks, watches, REPL) |
| ,dh | Hover widgets |
| ,de | Eval expression (normal/visual) |

Built-ins: `:DapContinue`, `:DapToggleBreakpoint`, `:DapTerminate`, `:DapStepOver`, … (`:help dap-commands`).

**STM32 / OpenOCD:** Start OpenOCD with GDB server on **port 3333**, pick config **“Attach: OpenOCD (STM32, :3333)”**, enter path to your **ELF with debug symbols** (`arm-none-eabi-gcc` build).

## FZF / tree

| Key | Action |
|-----|--------|
| ,e | NERDTree toggle |
| ,ff | Files |
| ,fg | Ripgrep (`rg`) or `:Lines` |
| ,fb | Buffers |

## Other

| Key | Action |
|-----|--------|
| ,, | Clear search highlight (`<leader><leader>`) |

## Plugins (short)

- **Commentary:** `gcc` (line), `gc` (motion/visual)
- **Surround:** `ys`, `cs`, `ds`

## Inspect all mappings (built-in)

```
:nmap
:vmap
:imap
:command
```

## If you see `E518` / `printf("Wrong` via modelines

Config uses `set nomodeline` so random source lines are not parsed as Vim options.
