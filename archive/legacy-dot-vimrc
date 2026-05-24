" ~/.vimrc — C/C++/Python-oriented setup (vim-plug + coc.nvim)
set nocompatible
syntax enable
filetype plugin indent on

set encoding=utf-8
set nomodeline
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

let mapleader = ','
let maplocalleader = ','

augroup dev_filetypes
  autocmd!
  autocmd FileType c,cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
augroup END

" ----- vim-plug (https://github.com/junegunn/vim-plug) -----
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  '
        \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

" coc.nvim: install language servers on first run (requires Node + clangd for C/C++)
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

function! s:OpenVimCheatsheet() abort
  let path = expand('~/.config/nvim/NVIM-CHEATSHEET.md')
  if !filereadable(path)
    echohl WarningMsg
    echom 'Cheatsheet missing: ' . path
    echohl None
    return
  endif
  execute 'silent! split' fnameescape(path)
endfunction
nnoremap <silent> <leader>? :call <SID>OpenVimCheatsheet()<CR>
command! -nargs=0 VimCheatsheet call <SID>OpenVimCheatsheet()

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>ff :Files<CR>
if executable('rg')
  nnoremap <leader>fg :Rg<CR>
else
  " Install ripgrep for fast repo-wide search: sudo apt install ripgrep
  nnoremap <leader>fg :Lines<CR>
endif
nnoremap <leader>fb :Buffers<CR>

nnoremap <leader><leader> :nohlsearch<CR>

highlight link CocInlayHint Comment
