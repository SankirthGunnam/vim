# Configuration overview (Neovim)

Portable Neovim config snapshot: **C/C++** and **Python**, **vim-plug**, **coc.nvim**, **fzf**, **NERDTree**, **vim-fugitive**, **vim-airline**, **vim-polyglot**, plus **nvim-dap** (Python + GDB, including STM32/OpenOCD attach).

Legacy classic-Vim **`~/.vimrc`** content is archived as [`archive/legacy-dot-vimrc`](archive/legacy-dot-vimrc); it is **not maintained** alongside `nvim/` on `main`.

---

## Git integration (inside the editor)

**No Git UI beyond fugitive** (no gitsigns lazygit — optional add-ons).

- **vim-fugitive** supplies **`:Git …`** and buffer-local maps in status/diff UIs; quick **Normal-mode** starts: **`,gs`**, **`,gc`**, **`,gp`**, **`,gl`**, **`,gb`**, **`,gD`**, **`,gL`** (see **SHORTCUTS.md**).
- **`vim-polyglot`** still adds **syntax** for commit messages, `.gitignore`, etc.

**Ripgrep** (`rg`) powers **`Ctrl+Shift+F`**, **`,fg`**, and fugitive’s pickers when used from Git buffers.

---

## File layout after install

| Repo file | Install to |
|-----------|-------------|
| `nvim/init.vim` | `~/.config/nvim/init.vim` |
| `nvim/lua/dap-setup.lua` | `~/.config/nvim/lua/dap-setup.lua` |
| `nvim/coc-settings.json` | `~/.config/nvim/coc-settings.json` |
| `nvim/NVIM-CHEATSHEET.md` | `~/.config/nvim/NVIM-CHEATSHEET.md` (**`,?`** opens it) |

Optional symlink **SHORTCUTS.md** / **CONFIGURATION.md** into `~/.config/nvim/` for local reading—commands **`:NvimCheatsheet`** only open `NVIM-CHEATSHEET.md`.

---

## Leader & vim-plug

| Setting | Value |
|---------|--------|
| `mapleader` / `maplocalleader` | `,` (comma) |

**vim-plug** bootstraps by downloading **`plug.vim`** with **`curl`** if missing:

`stdpath('data')/site/autoload/plug.vim` · usually **`~/.local/share/nvim/site/autoload/plug.vim`**

Plugins install under **`stdpath('data')/plugged`** (typically **`~/.local/share/nvim/plugged`**). Run **`:PlugInstall`** after cloning.

---

## Plugins (vim-plug)

| Plugin | Role |
|--------|------|
| `tpope/vim-sensible` | Sane defaults (`:help sensible`) |
| `tpope/vim-commentary` | Comments |
| `tpope/vim-surround` | Surround edits |
| `tpope/vim-repeat` | Repeat `.` for supported plugin ops |
| `editorconfig/editorconfig-vim` | `.editorconfig` |
| `vim-airline/vim-airline` | Status/tab line |
| `junegunn/fzf`, `junegunn/fzf.vim` | Fuzzy finder UI |
| `preservim/nerdtree` | File tree |
| `tpope/vim-fugitive` | **`:Git`** / blame / staging (`:help fugitive`) |
| `sheerun/vim-polyglot` | Syntax packs |
| `neoclide/coc.nvim` (release branch) | LSP / completion / diagnostics |

**DAP stack (Lua):**

| Plugin | Role |
|--------|------|
| `mfussenegger/nvim-dap` | DAP core |
| `nvim-neotest/nvim-nio` | `dap-ui` dependency |
| `rcarriga/nvim-dap-ui` | Sidebar / scopes / REPL |
| `theHamsta/nvim-dap-virtual-text` | Inline values |
| `mfussenegger/nvim-dap-python` | Python (debugpy) |

---

## CoC extensions (`g:coc_global_extensions`)

Needs **Node.js**:

- `coc-json`
- `coc-clangd`
- `coc-pyright`

`nvim/coc-settings.json`: clangd (e.g. C++20 fallback, tidy), Python analysis tweaks.

---

## Options in `nvim/init.vim`

| Option | Meaning (short) |
|--------|------------------|
| `encoding=utf-8` | UTF-8 |
| `nomodeline` | Ignore modelines (avoids bogus `E518` from strings in source) |
| `number relativenumber` | Hybrid line numbers |
| `signcolumn=yes` | Stable gutter |
| `hidden` | Buffer switching without `:w` everywhere |
| `updatetime=300` | Faster CoC / CursorHold-ish behavior |
| `mouse=a` | Mouse across modes |
| `hlsearch incsearch ignorecase smartcase` | Search UX |
| `splitbelow splitright` | New split orientation |
| `scrolloff=3` | Context lines around cursor |
| `clipboard=unnamedplus` | System clipboard (`+`) |
| `wildmenu wildmode=list:longest,full` | Cmdline completion UX |
| `backspace=indent,eol,start` | Backspace through indent/newline |
| `termguicolors` | True color when supported |

**FileType** `c` / `cpp` / `python`: **4-space** **`expandtab`**.

**Airline:** `Powerline fonts` off · tab line on.

---

## Custom commands (`init.vim`)

| Command | Action |
|---------|--------|
| `:CocFormat` | Format buffer |
| `:NvimCheatsheet` | Split-open `NVIM-CHEATSHEET.md` |

**`,?`** → same cheatsheet split.

---

## DAP (`nvim/lua/dap-setup.lua`)

- **Adapter:** **`gdb-multiarch`** if installed, else **`gdb`** **`--interpreter=dap`** (GDB **14+**).
- **Configurations:** launch local exe; attach **`:1234`**; attach **OpenOCD** **`:3333`** (STM32).
- **Python:** `dap-python` + **`python3`** (install **debugpy** as needed).

---

Depth keybinding tables: **`SHORTCUTS.md`**.
