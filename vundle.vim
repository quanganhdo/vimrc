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
Bundle 'godlygeek/tabular'
Bundle 'YankRing.vim'
Bundle 'mhinz/vim-signify'
Bundle 'mhinz/vim-startify'
Bundle 'sjl/gundo.vim'
Bundle 'AutoComplPop'
Bundle 'rdolgushin/snipMate-acp'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/syntastic'

filetype plugin indent on       " load file type plugins + indentation

set t_Co=256
colorscheme solarized
