# Vim / Neovim shortcuts

**Leader:** `,` (comma)

**Editors:** Plain **Vim** uses `~/.vimrc`; **Neovim** uses `~/.config/nvim/init.vim`. Most mappings match. **Debugging (DAP)** is **Neovim only**.

**Open cheatsheet:** `,?` · **`:VimCheatsheet`** · **`:NvimCheatsheet`**

*(Also see `NVIM-CHEATSHEET.md` in this directory.)*

---

## Built-in Vim you use every day (no plugin)

Motion and editing behave like standard Vim. Useful reminders:

| Keys | Normal mode |
|------|--------------|
| `h` `j` `k` `l` | Move |
| `w` `e` `b` | Word motions |
| `0` `^` `$` | Line start / first non-blank / end |
| `gg` `G` | File top / bottom |
| `{` `}` | Paragraph |
| `%` | Matching bracket |
| `*` `#` | Next / prev identifier under cursor |
| `/` `?` | Search forward / backward |
| `n` `N` | Next / prev search hit |
| `:` | Command line |
| `u` `<C-r>` | Undo / redo |
| `.` | Repeat last change |
| `>>` `<<` | Indent / dedent |
| `=` motion | Auto-indent |
| `>>` `.` pipeline | Indent line, repeat |

**Splits / windows**

| Keys | Action |
|------|--------|
| `:sp` `:vsp` | Horizontal / vertical split |
| `<C-w>w` | Cycle windows |
| `<C-w>h|j|k|l` | Focus left/down/up/right |
| `<C-w>c` `<C-w>o` | Close / only this window |

**Tabs / buffers (Airline shows tab line)**

| Keys | Action |
|------|--------|
| `:bnext` `:bprev` | Next / prev buffer (`:bn` `:bp`) |
| `:bd` | Close buffer |
| `:ls` | List buffers |

**Visual mode**

| Keys | Action |
|------|--------|
| `v` `V` `<C-v>` | Char / line / block visual |
| `o` | Swap anchor in visual |

**Shift+C reminder:** **`C`** = change from cursor to end of line (`c$`). Your config avoids remapping it; use **`,?`** (`leader` `?`) for the cheatsheet.

---

## This config — Normal mode extras

### Search highlights

| Key | Action |
|-----|--------|
| `leader` **`leader`** (`,,`) | `:nohlsearch` — clear search highlight |

*(`<leader>` = `,`)

### FZF + NERDTree

| Key | Action |
|-----|--------|
| `leader` **`e`** | NERDTree toggle |
| `leader` **`ff`** | `:Files` — fuzzy find files |
| `leader` **`fg`** | `:Rg` (if `rg` installed) · else `:Lines` in-buffer lines |
| `leader` **`fb`** | `:Buffers` |

Inside FZF (default plugin bindings): **`Ctrl‑t`** open tab **`Ctrl‑x`** split **`Ctrl‑v`** vertical split **`Enter`** default action.

### Terminal split (`:terminal`)

While the embedded shell has focus (**Terminal-insert** mode), Neovim would otherwise send keys to the shell. These extra maps mirror normal **`Ctrl+w`** window moves:

| Key | Action |
|-----|--------|
| `Ctrl+w` `h`/`j`/`k`/`l` | Move focus to adjacent window |
| `Ctrl+w` arrow keys | Same (↑ `k`, ↓ `j`, ← `h`, → `l`) |
| `Ctrl+w` `Ctrl+w` | Next window (cycle) |

`Ctrl+\` `Ctrl+N` still leaves Terminal-insert → **Terminal-Normal** mode (scroll/copy, `:q`, etc.). From Normal mode elsewhere, **`Ctrl+w`** works as usual.

---

## CoC.nvim — Insert mode

| Key | Action |
|-----|--------|
| **`Tab`** | Next completion candidate, or real Tab / trigger refresh |
| **`Shift‑Tab`** | Previous completion |
| **`Enter`** | Confirm completion |
| **`Ctrl‑Space`** | Refresh completions |

---

## CoC.nvim — Normal / visual mode (LSP / diagnostics)

| Key | Action |
|-----|--------|
| **`[g`** / **`]g`** | Previous / next diagnostic |
| **`gd`** | Go to definition |
| **`gy`** | Type definition |
| **`gi`** | Implementation |
| **`gr`** | References |
| **`K`** | Hover documentation |
| `leader` **`rn`** | Rename symbol |
| `leader` **`f`** | Format selection (visual / operator) |
| `:CocFormat` | Format whole buffer |
| **`Ctrl‑d`** / **`Ctrl‑u`** | Scroll **CoC floating window** when focused; otherwise normal scroll half-page |

Useful CoC commands (type **`:Coc`** + Tab): **`:CocCommand`**, **`:CocRestart`**, **`:CocInfo`**.

---

## tpope plugins (short)

### vim-commentary

| Keys | Mode | Action |
|------|------|--------|
| **`gcc`** | Normal | Comment / uncomment current line |
| **`gc`** + motion | Normal | Comment motion (e.g. `gcip` paragraph) |
| **`gc`** | Visual | Toggle comment on selection |

### vim-surround

| Keys | Meaning |
|------|---------|
| **`ys`** + motion + delim | Surround motion (e.g. `ysiw"` word in quotes) |
| **`cs`** old new | Change surround (`cs"'` change `"` → `'`) |
| **`ds`** char | Delete surround |
| **`S`** | In visual mode, surround selection |

Repeat supported operations with **`vim-repeat`**: **``.**

---

## Neovim only — nvim-dap (`lua/dap-setup.lua`)

Pick config when prompted; **STM32/OpenOCD:** GDB server **`localhost:3333`**.

| Key | Action |
|-----|--------|
| `leader` **`dc`** | Continue / start (pick adapter config) |
| `leader` **`dC`** | Run **last** session |
| `leader` **`db`** | Toggle breakpoint |
| `leader` **`dB`** | Conditional breakpoint (prompt) |
| `leader` **`dl`** | Clear breakpoints |
| `leader` **`dj`** | Step over |
| `leader` **`di`** | Step into |
| `leader` **`do`** | Step out |
| `leader` **`dr`** | Restart |
| `leader` **`dq`** | Terminate |
| `leader` **`du`** | Toggle **dap-ui** sidebar |
| `leader` **`dh`** | Hover widgets |
| `leader` **`de`** | Eval expression (normal / visual) |

Commands: `:DapContinue`, `:DapToggleBreakpoint`, `:DapTerminate`, `:help dap-commands`.

**dap-ui** panel (keyboard when focus is UI): **`CR`** / double-click expand; **`o`** open; **`d`** remove; **`e`** edit; **`r`** REPL; **`t`** toggle.

---

## Inspect what is mapped (discovery)

Inside Vim/Neovim:

```
:nmap
:vmap
:imap
:command
:verbose map <leader>ff
```

---

## Git

There are **no** Vim keybindings for `:Git`, `:Gdiff`, blame, hunks, etc. Use the terminal **`git`** CLI (or install **vim-fugitive** / **gitsigns** later).
