set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'

Plugin 'altercation/vim-colors-solarized'
Plugin 'posva/vim-vue'
Plugin 'elmcast/elm-vim'
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on

set title

set number
set ruler
set wrap

set scrolloff=3

set guioptions=T

set ignorecase
set smartcase

set incsearch
set hlsearch

set visualbell
set noerrorbells

set hidden

set backspace=indent,eol,start

set laststatus=2

syntax enable
set cursorline

filetype plugin on
filetype indent on

set background=dark
colorscheme solarized

set tabstop=2
set softtabstop=2
set expandtab

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
map <right> <nop>
nnoremap <CR> :noh<CR><CR>

if !has('gui_running')
  set t_Co=256
endif

