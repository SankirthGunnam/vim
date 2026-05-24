# Neovim cheat sheet (CoC)

**Leader:** **`<Space>`** (`mapleader`; lone Space → **`<NOP>`**) · cheat sheet: **`<Space>?`** · **`:NvimCheatsheet`**

**Debugging:** **nvim-dap** (needs `lua/dap-setup.lua` via `init.vim`).

## Why not Shift+C?

Normal **`C`** = **`c$`**. Prefer **`<Space>?`** (`<leader>?`) instead of stealing **`C`** for cheatsheet.

## CoC — completion (insert mode)

| Key | Action |
|-----|--------|
| Tab | Next completion / indent |
| Shift+Tab | Previous completion |
| Enter | Confirm completion |
| Ctrl+Space | Refresh completions |

## CoC — LSP / diagnostics (normal)

Chord keys below = **`Space`** + rest (e.g. **`rn`** = **`<Space>rn`**).

| Key | Action |
|-----|--------|
| gd | Definition |
| gy | Type definition |
| gi | Implementation |
| gr | References |
| K | Hover docs |
| [g / ]g | Prev / next diagnostic |
| `Space` rn | Rename symbol |
| `Space` f | Format selection / operator |
| :CocFormat | Format buffer |

## Float scroll

| Key | Action |
|-----|--------|
| Ctrl+d / Ctrl+u | Scroll CoC float (else half-page scroll) |

## Debugging (nvim-dap)

| Key | Action |
|-----|--------|
| `Space` dc | Continue / pick config |
| `Space` dC | Run last session |
| `Space` db | Toggle breakpoint |
| `Space` dB | Conditional breakpoint |
| `Space` dl | Clear breakpoints |
| `Space` dj | Step over |
| `Space` di | Step into |
| `Space` do | Step out |
| `Space` dr | Restart |
| `Space` dq | Terminate |
| `Space` du | Toggle dap-ui |
| `Space` dh | Hover widgets |
| `Space` de | Eval expression |

Built-ins: `:DapContinue`, `:DapToggleBreakpoint`, `:help dap-commands`.

**STM32 / OpenOCD:** GDB on **`:3333`**, firmware ELF with symbols.

## FZF / tree / Git (`:Git`)

| Key | Action |
|-----|--------|
| `Space` p | Files |
| Ctrl+Shift+F | Rg (needs **rg**) |
| `Space` Shift+P (`<Space><S-p>`) | `:Commands` |
| Ctrl+N | NERDTree toggle |
| `Space` nf | NERDTreeFind |
| `Space` e | NERDTree toggle |
| `Space` ff | Files (alternate) |
| `Space` fg | Rg · else `:Lines` |
| `Space` fb | Buffers |
| `Space` gs / gc | `:Git` / commit |
| `Space` gp / gl | push / pull |
| `Space` gb / gD / gL | blame / diff / log |

## Other

| Key | Action |
|-----|--------|
| `Space` `Space` | Clear search highlights |

## Plugins (short)

- **Commentary:** `gcc`, `gc` + motion
- **Surround:** `ys`, `cs`, `ds`
- **Fugitive:** `:help fugitive`

## Inspect mappings

```
:nmap
:vmap
:imap
:command
```

## Modelines

`set nomodeline` avoids stray `E518` from funny strings.
