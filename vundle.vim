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
Bundle 'bufexplorer.zip'
Bundle 'Gundo'
Bundle 'matchit.zip'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
Bundle 'SuperTab'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'twe4ked/vim-peepopen'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-surround'
Bundle 'ZoomWin'

filetype plugin indent on       " load file type plugins + indentation

colorscheme solarized

