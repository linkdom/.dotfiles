syntax on
:set background=dark
:set t_Co=256
:set nu
:set ruler
:set hlsearch
:set incsearch
:set autoindent
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set relativenumber
:set nohlsearch
:set hidden
:set noerrorbells
:set nowrap
:set ignorecase
:set smartcase
:set scrolloff=15
:set sidescrolloff=15
:set nocompatible

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

let mapleader = "\<space>"

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

source ~/.config/vim/plugins/fzf.vim
source ~/.config/vim/plugins/commentary.vim
source ~/.config/vim/plugins/surround.vim
source ~/.config/vim/plugins/polyglot.vim
source ~/.config/vim/plugins/oceanic-next.vim

call plug#end()

colorscheme OceanicNext

" Keyboard Remaps
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Rg<CR>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
