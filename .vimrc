syntax on
set relativenumber

"leader key
let mapleader=" "

" tab setting
set tabstop=4 
set shiftwidth=4
set softtabstop=4
set expandtab

" smart search
set ignorecase
set smartcase

" smart wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

" search as characters are entered
set incsearch

" stop auto commenting
set formatoptions-=cro

set autoindent
set smarttab
set ruler
set backspace=indent,eol,start
set encoding=utf-8

" leader keys; <CR> is a carriage return(?)
" open terminal
nnoremap <leader>t :term<CR>
" yank to system clipboard
nnoremap <leader>y "*y
" put from system clipboard
nnoremap <leader>p "*p
" NERDTree keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" install vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    Plug 'https://github.com/rakr/vim-one'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'

call plug#end()

colorscheme one
set background=dark " for the dark version

" security options
set nomodeline

" pymode, stops error window from popping up
let g:pymode_lint_cwindow = 0

" https://stackoverflow.com/questions/6488683/
" how-to-change-the-cursor-between-normal-and-insert-modes-in-vim/42118416#42118416
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
