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
Bundle 'taglist.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-surround'
Bundle 'ZoomWin'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/vitality.vim'

filetype plugin indent on       " load file type plugins + indentation

colorscheme solarized
