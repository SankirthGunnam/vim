# vim — dotfiles snapshot

Configs for **[SankirthGunnam/vim](https://github.com/SankirthGunnam/vim)**: Vim + Neovim with **vim-plug**, **CoC** (clangd/pyright/json), **fzf**, **NERDTree**, **Airline**, Polyglot syntax packs. Neovim adds **nvim-dap** for C/C++/Python (+ STM32 via OpenOCD).

## Documents in this repo

| File | Description |
|------|--------------|
| [SHORTCUTS.md](SHORTCUTS.md) | Keybindings reference (built-ins + plugins) |
| [CONFIGURATION.md](CONFIGURATION.md) | Options, plugins, CoC/DAP, **Git/not-Git** note |

## Quick install

1. Clone this repo somewhere (e.g. `~/repos/vim`).

   ```bash
   git clone git@github.com:SankirthGunnam/vim.git ~/repos/vim
   ```

2. **Vim:** link or copy `vim/.vimrc` → `~/.vimrc`:

   ```bash
   ln -sf ~/repos/vim/.vimrc ~/.vimrc
   ```

3. **Neovim:**

   ```bash
   mkdir -p ~/.config/nvim/lua
   ln -sf ~/repos/vim/nvim/init.vim ~/.config/nvim/init.vim
   ln -sf ~/repos/vim/nvim/lua/dap-setup.lua ~/.config/nvim/lua/dap-setup.lua
   ln -sf ~/repos/vim/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
   ln -sf ~/repos/vim/nvim/NVIM-CHEATSHEET.md ~/.config/nvim/NVIM-CHEATSHEET.md
   ```

   On first launch, **vim-plug** may download itself via `curl`. Then run `:PlugInstall`. **CoC** needs **Node**; install `:CocInstall` bundles or rely on `g:coc_global_extensions`.

4. Dependencies (recommended):

   - **Node.js** — CoC
   - **`clangd`** — C/C++ LSP  
   - **`rg` (ripgrep)** — for `leader+fg` project search  
   - **Neovim + GDB 14+** — debugging; **`gdb-multiarch`** optional  
   - **Python `debugpy`** — `python3 -m pip install --user debugpy` (optional, for nvim-dap Python)

## Git in the editor?

**Git is not wired into these configs** (no fugitive, gitsigns, etc.). `.gitconfig`/`core.editor` is up to you. See [CONFIGURATION.md](CONFIGURATION.md).

## Updating from your machine

After editing locally:

```bash
cd ~/repos/vim
git add .
git commit -m "Describe your edit."
git push origin HEAD
```

## License

Config files are your own usage; upstream plugins retain their respective licenses.
