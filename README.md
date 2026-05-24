# Neovim configuration

**Maintained configs** for **[SankirthGunnam/vim](https://github.com/SankirthGunnam/vim)** (**Neovim only** going forward): **vim-plug**, **CoC** (clangd / pyright / json), **fzf**, **NERDTree**, **Airline**, Polyglot packs, plus **nvim-dap** (C/C++/Python, STM32 + OpenOCD).

Legacy classic-Vim **`~/.vimrc`** snapshots live under [`archive/`](archive/) only; Git history keeps every prior commit unchanged.

---

## Repo layout

| Path | Purpose |
|------|---------|
| [`nvim/init.vim`](nvim/init.vim) | Main Neovim init |
| [`nvim/lua/dap-setup.lua`](nvim/lua/dap-setup.lua) | DAP adapters (GDB, Python) |
| [`nvim/coc-settings.json`](nvim/coc-settings.json) | CoC/clangd/pyright knobs |
| [`nvim/NVIM-CHEATSHEET.md`](nvim/NVIM-CHEATSHEET.md) | Quick table (opened with **`,?`**) |
| [`SHORTCUTS.md`](SHORTCUTS.md) | Full key reference |
| [`CONFIGURATION.md`](CONFIGURATION.md) | Options / plugins overview |
| [`archive/legacy-dot-vimrc`](archive/legacy-dot-vimrc) | Frozen classic Vim RC (unsupported) |

---

## Install (symlinks)

Clone then link into `~/.config/nvim/`:

```bash
git clone git@github.com:SankirthGunnam/vim.git ~/repos/vim
mkdir -p ~/.config/nvim/lua
ln -sf ~/repos/vim/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/repos/vim/nvim/lua/dap-setup.lua ~/.config/nvim/lua/dap-setup.lua
ln -sf ~/repos/vim/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf ~/repos/vim/nvim/NVIM-CHEATSHEET.md ~/.config/nvim/NVIM-CHEATSHEET.md
```

On first launch **vim-plug** may bootstrap with `curl`, then `:PlugInstall`. **CoC** needs **Node**; extensions follow `g:coc_global_extensions` in `init.vim`.

Optional local docs (not required for `:NvimCheatsheet`):

```bash
ln -sf ~/repos/vim/SHORTCUTS.md ~/.config/nvim/SHORTCUTS.md
ln -sf ~/repos/vim/CONFIGURATION.md ~/.config/nvim/CONFIGURATION.md
```

### Dependencies

- **Node.js** — CoC  
- **`clangd`** — C/C++ LSP  
- **`rg`** — `leader`-`fg` workspace search  
- **GDB 14+** (optional **`gdb-multiarch`**) — DAP debugging  
- **`python3 -m pip install --user debugpy`** — Python debugging (optional)

---

## Contributing / updates

This repo accepts **Neovim-related** edits only; do not resurrect active classic-Vim duplication on `main` without a deliberate decision.

---

## Git in the editor?

No fugitive / gitsigns integration—see [`CONFIGURATION.md`](CONFIGURATION.md).

---

## Updating from your machine

```bash
cd ~/repos/vim
git pull
nvim +"source $MYVIMRC"
```
