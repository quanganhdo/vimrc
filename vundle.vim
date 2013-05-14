"" Behaviors
set nocompatible                " choose no compatibility with legacy vi
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Kick off Vundle
Bundle 'gmarik/vundle'

" Alternate file
Bundle 'a.vim'

" Ack
Bundle 'mileszs/ack.vim'

" Theme
Bundle 'altercation/vim-colors-solarized'
Bundle 'quanganhdo/grb256'

" Auto close pairs
Bundle 'Raimondi/delimitMate'

" Essentials
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-surround'

" Text objects
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Zoom in/out of buffer
Bundle 'ZoomWin'

" Tmux fixes
Bundle 'sjl/vitality.vim'

" Indent code
Bundle 'godlygeek/tabular'

" Keep yanked stuff on a ring
Bundle 'YankRing.vim'

" SVN/Git changes on signs bar
Bundle 'mhinz/vim-signify'

" Start page
Bundle 'mhinz/vim-startify'

" Undo tree
Bundle 'sjl/gundo.vim'

" Ruby/Rails stuff
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" Syntax checking
Bundle 'scrooloose/syntastic'

" Much faster than ctrlp
" Needs system ruby 
Bundle 'wincent/Command-T'

" Auto completion
" Needs libclang and whatnot
Bundle 'Valloric/YouCompleteMe'

" Snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
