" This is the skeleton of plugins.vim

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
 	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall
	"autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')

    " Here you can plug all the plugins you want
    " Let's try to plug these packages

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " comments
    Plug 'tpope/vim-commentary'
    " linters
    Plug 'dense-analysis/ale'
    " colorscheme
    Plug 'junegunn/seoul256.vim'    
call plug#end()

set number

" colorscheme
colo seoul256

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" Clipboard {{{
set clipboard+=unnamedplus
" }}} Clipboard
"
" No arrow keys allowed
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" vim-commentary
autocmd FileType nim setlocal commentstring=#\ %s

" Ale
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\}
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1
