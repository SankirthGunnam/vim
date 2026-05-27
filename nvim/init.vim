" ~/.config/nvim/init.vim — C/C++/Python (vim-plug + coc.nvim), ported from ~/.vimrc

syntax enable
filetype plugin indent on

set encoding=utf-8
set nomodeline
" Avoid modeline parsing mistaking source lines (e.g. printf("Wrong...") ) for options — see neovim #35975 / netrw.
set number relativenumber
set signcolumn=yes
set hidden
set updatetime=300
set mouse=a
set hlsearch incsearch ignorecase smartcase
set splitbelow splitright
set scrolloff=3
set clipboard=unnamedplus
set wildmenu wildmode=list:longest,full
set backspace=indent,eol,start

if has('termguicolors')
  set termguicolors
endif

" Space leader (see :help mapleader).
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
" Avoid Space acting like `l` while still allowing <Space> as prefix for chords.
nnoremap <silent> <Space> <NOP>
xnoremap <silent> <Space> <NOP>

augroup dev_filetypes
  autocmd!
  autocmd FileType c,cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
augroup END

" ----- vim-plug: Neovim uses stdpath('data') -----
let s:plug_autoload = stdpath('data') . '/site/autoload/plug.vim'
let s:plug_downloaded = 0
if empty(glob(s:plug_autoload))
  silent execute '!curl -fLo ' . shellescape(s:plug_autoload) . ' --create-dirs '
        \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  let s:plug_downloaded = 1
endif
if empty(glob(s:plug_autoload))
  echohl ErrorMsg
  echom 'vim-plug bootstrap failed: could not download plug.vim (check curl/network).'
  echohl None
  finish
endif
if s:plug_downloaded
  autocmd VimEnter * ++once PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'tpope/vim-fugitive'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-python'

call plug#end()

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-clangd',
      \ 'coc-pyright',
      \ ]

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> K :call CocActionAsync('doHover')<CR>

nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"

command! -nargs=0 CocFormat :call CocActionAsync('format')

" Shift+C is normal-mode `C` (change to end of line). Use <leader>? (Space then ?) for the cheatsheet.
function! s:OpenNvimCheatsheet() abort
  let path = stdpath('config') . '/NVIM-CHEATSHEET.md'
  if !filereadable(path)
    echohl WarningMsg
    echom 'Cheatsheet missing: ' . path
    echohl None
    return
  endif
  execute 'silent! split' fnameescape(path)
endfunction
nnoremap <silent> <leader>? :call <SID>OpenNvimCheatsheet()<CR>
command! -nargs=0 NvimCheatsheet call <SID>OpenNvimCheatsheet()

" ----- fzf & NERDTree (leader + Ctrl+Shift where terminal supports it) -----
" <Space>p = Files · <Space><S-p> (Shift+P) = :Commands fuzzy palette · Ctrl+Shift+F = :Rg if distinct escape.
nnoremap <silent> <leader>p :Files<CR>
if executable('rg')
  nnoremap <silent> <C-S-f> :Rg<CR>
endif
nnoremap <silent> <leader><S-p> :Commands<CR>

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>ff :Files<CR>
if executable('rg')
  nnoremap <leader>fg :Rg<CR>
else
  nnoremap <leader>fg :Lines<CR>
endif
nnoremap <leader>fb :Buffers<CR>

nnoremap <silent> <leader>cp :let @+ = expand('%')<CR>:echo 'Copied relative path'<CR>
nnoremap <silent> <leader>cpa :let @+ = expand('%:p')<CR>:echo 'Copied absolute path'<CR>

" ----- fugitive (:Git) — leaders below avoid masking CoC gd / gy / gi / gr -----
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gl :Git pull<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gD :Git diff<CR>
nnoremap <silent> <leader>gL :Git log<CR>

" Terminal-insert: <C-w> is passed to the shell by default — forward window nav like Normal mode.
tnoremap <silent> <C-w>h <C-\><C-N><C-w>h
tnoremap <silent> <C-w>j <C-\><C-N><C-w>j
tnoremap <silent> <C-w>k <C-\><C-N><C-w>k
tnoremap <silent> <C-w>l <C-\><C-N><C-w>l
tnoremap <silent> <C-w><Left> <C-\><C-N><C-w>h
tnoremap <silent> <C-w><Right> <C-\><C-N><C-w>l
tnoremap <silent> <C-w><Up> <C-\><C-N><C-w>k
tnoremap <silent> <C-w><Down> <C-\><C-N><C-w>j
tnoremap <silent> <C-w><C-w> <C-\><C-N><C-w>w

nnoremap <leader><leader> :nohlsearch<CR>

highlight link CocInlayHint Comment

augroup nvim_dap_setup
  autocmd!
  autocmd VimEnter * ++once lua require('dap-setup')
augroup END
