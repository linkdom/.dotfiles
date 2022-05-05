syntax on
:set background=dark
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
:set scrolloff=8

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme gruvbox

" Keyboard Remaps
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-g> :Rg<CR>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
