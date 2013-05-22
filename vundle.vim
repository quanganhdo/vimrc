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
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" Auto close pairs
Bundle 'Raimondi/delimitMate'

" Code commentary
Bundle 'tpope/vim-commentary' 

" End structures automatically
Bundle 'tpope/vim-endwise'    

" Git
Bundle 'tpope/vim-fugitive'   

" Dot commands for plugin maps
Bundle 'tpope/vim-repeat'     

" Unix shell commands
Bundle 'tpope/vim-eunuch'     

" Readline key bindings
Bundle 'tpope/vim-rsi'        

" Quoting/parenthesizing
Bundle 'tpope/vim-surround'   

" Change vim dir to project root
Bundle 'airblade/vim-rooter'  

" Text objects
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Zoom in/out of buffer
Bundle 'ZoomWin'

" Tmux fixes
Bundle 'sjl/vitality.vim'
Bundle 'tpope/vim-tbone'

" Indent code
Bundle 'godlygeek/tabular'

" Keep yanked stuff on a ring
Bundle 'YankRing.vim'

" SVN/Git changes on signs bar
Bundle 'mhinz/vim-signify'

" Undo tree
Bundle 'sjl/gundo.vim'

" Ruby/Rails stuff
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'

" C stuff
Bundle 'majutsushi/tagbar'

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
