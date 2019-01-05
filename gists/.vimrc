set nocompatible
filetype off

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set tabstop=4
set softtabstop=4
set shiftwidth=4

set encoding=utf-8
set nu
set clipboard=unnamed

" python-mode
let g:pymode_python = 'python3'
let g:pymode_folding = 1
let g:pymode_lint_on_unmodified = 1
let g:pymode_lint_on_fly = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_run_bind = '<F5>'

" NERDTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

filetype plugin indent on
