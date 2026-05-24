# Configuration overview

Portable copies of configs from the machine where this snapshot was produced. Targets **C/C++ and Python** with **vim-plug**, **CoC.nvim**, **fzf**, **NERDTree**, **Airline**. **Neovim** adds **nvim-dap** (Python + GDB, including STM32/OpenOCD attach).

---

## Git and Vim — are they integrated?

**No dedicated Git-from-Vim setup** is configured.

- Plugins such as **vim-fugitive**, **gitsigns.nvim**, or **lazygit** are **not** installed.
- **`core.editor`/merge tool** Git settings were **not read** here (no `~/.gitconfig` found in this environment); set them yourself if you want `git commit` to open Vim/Neovim.
- **`vim-polyglot`** contributes **syntax highlighting** for Git-related file types (`gitcommit`, `gitconfig`, `.gitignore`, etc.) only — not Git commands inside the editor.

**Ripgrep** (`rg`) powers project-wide search (**`,fg`**) when available; results include files under `.git/` unless excluded by `rg`/`.ignore` habits (not overridden in these configs).

---

## File layout after install

| File | Typical location | Editor |
|------|-------------------|--------|
| `.vimrc` | `~/.vimrc` | Vim |
| `nvim/init.vim` | `~/.config/nvim/init.vim` | Neovim |
| `nvim/lua/dap-setup.lua` | `~/.config/nvim/lua/dap-setup.lua` | Neovim |
| `nvim/coc-settings.json` | `~/.config/nvim/coc-settings.json` | Neovim (CoC) |
| `nvim/NVIM-CHEATSHEET.md` | `~/.config/nvim/NVIM-CHEATSHEET.md` | Both (opened by **`,?`**) |

**Note:** Vim’s `.vimrc` opens the cheatsheet at `~/.config/nvim/NVIM-CHEATSHEET.md` — keep that path in sync when using plain Vim.

---

## Leader and plugin bootstrap

| Setting | Value |
|---------|--------|
| `mapleader` / `maplocalleader` | `,` (comma) |

**vim-plug** bootstraps by downloading `plug.vim` with `curl` if missing:

- Vim: `~/.vim/autoload/plug.vim`
- Neovim: `stdpath('data')/site/autoload/plug.vim` (usually `~/.local/share/nvim/site/autoload/plug.vim`)

Neovim plugins install under `stdpath('data')/plugged` (typically `~/.local/share/nvim/plugged`).

Then run `:PlugInstall` in the editor after first launch.

---

## Plugins (vim-plug)

| Plugin | Purpose |
|--------|---------|
| `tpope/vim-sensible` | Baseline sane defaults (`:help sensible`) |
| `tpope/vim-commentary` | Comments (`gcc`, `gc` + motion) |
| `tpope/vim-surround` | Surround edits (`ys`, `ds`, `cs`, visual `S`) |
| `tpope/vim-repeat` | Repeat supported plugin actions with `.` |
| `editorconfig/editorconfig-vim` | Honor `.editorconfig` |
| `vim-airline/vim-airline` | Status/tab line |
| `junegunn/fzf` + `junegunn/fzf.vim` | Fuzzy finder |
| `preservim/nerdtree` | File tree |
| `sheerun/vim-polyglot` | Many language packs / syntax files |
| `neoclide/coc.nvim` (release) | LSP completion/diagnostics/etc. |

**Neovim only:**

| Plugin | Purpose |
|--------|---------|
| `mfussenegger/nvim-dap` | Debug Adapter Protocol core |
| `nvim-neotest/nvim-nio` | Async I/O dependency for dap-ui |
| `rcarriga/nvim-dap-ui` | Sidebar / scopes / REPL UI |
| `theHamsta/nvim-dap-virtual-text` | Inline values |
| `mfussenegger/nvim-dap-python` | Python (debugpy) |

---

## CoC extensions (`g:coc_global_extensions`)

Installed via CoC (Node required):

- `coc-json`
- `coc-clangd`
- `coc-pyright`

`nvim/coc-settings.json` customizes clangd (C++20 fallback, tidy) and Python analysis defaults.

---

## Options set in `.vimrc` / `nvim/init.vim`

Vim Classic sets `set nocompatible`; Neovim omits it (always nocompatible).

| Option | Meaning (short) |
|--------|------------------|
| `encoding=utf-8` | UTF-8 |
| `nomodeline` | Do not evaluate modelines (`E518`/security) |
| `number relativenumber` | Hybrid line numbers |
| `signcolumn=yes` | Gutter width for diagnostics |
| `hidden` | Switch buffers without saving every time |
| `updatetime=300` | Faster CursorHold / diagnostic refresh |
| `mouse=a` | Mouse in all modes |
| `hlsearch incsearch ignorecase smartcase` | Search behavior |
| `splitbelow splitright` | Split directions |
| `scrolloff=3` | Keep context lines above/below cursor |
| `clipboard=unnamedplus` | System clipboard (`+`), Linux/X/Wayland |
| `wildmenu wildmode=list:longest,full` | Enhanced command-line completion |
| `backspace=indent,eol,start` | Backspace across indent / join lines |
| `termguicolors` | True color (when supported) |

**Indent** (via `FileType`): `c`, `cpp`, `python` → `shiftwidth`, `tabstop`, `softtabstop` **4**, `expandtab`.

**Airline:** `g:airline_powerline_fonts = 0`; tabline enabled.

---

## Commands defined in Vimscript

| Command | Action |
|---------|--------|
| `:CocFormat` | Format whole buffer (`CocActionAsync('format')`) |
| `:VimCheatsheet` | Open cheatsheet Markdown (`.vimrc` copies only) |
| `:NvimCheatsheet` | Same for Neovim (`init.vim`) |

Leader mapping **`,?`** opens `NVIM-CHEATSHEET.md`.

---

## DAP (`nvim/lua/dap-setup.lua`)

- **GDB adapter:** `gdb-multiarch` if installed, otherwise `gdb` with `--interpreter=dap` (needs **GDB 14+**).
- **Configurations:** local launch; attach `:1234`; attach OpenOCD **`:3333`** (STM32-friendly).
- **Python:** `dap-python` with `python3` (prefer `python3 -m debugpy`).
- **UI:** Opens on attach/launch; closes on terminate; **dap-ui** expand/open mappings inside the sidebar (CR, mouse, etc. — see `dap-setup.lua`).

---

see **SHORTCUTS.md** for every keybinding in one place.
