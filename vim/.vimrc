set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'

Plugin 'altercation/vim-colors-solarized'

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

syntax enable

filetype plugin on
filetype indent on

set background=dark
colorscheme solarized

