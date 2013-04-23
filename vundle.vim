"" Behaviors
set nocompatible                " choose no compatibility with legacy vi
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Kick off Vundle
Bundle 'gmarik/vundle'

Bundle 'a.vim'
Bundle 'mileszs/ack.vim'
Bundle 'matchit.zip'
Bundle 'snipMate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-surround'
Bundle 'ZoomWin'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/vitality.vim'
Bundle 'SuperTab'
Bundle 'godlygeek/tabular'
Bundle 'YankRing.vim'
Bundle 'mhinz/vim-signify'
Bundle 'sjl/gundo.vim'
Bundle 'xolox/vim-easytags'

filetype plugin indent on       " load file type plugins + indentation

set t_Co=256
colorscheme solarized
