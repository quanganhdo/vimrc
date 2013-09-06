" Kick off 
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Alternate file
NeoBundle 'a.vim'

" Ack
NeoBundle 'mileszs/ack.vim'

" Theme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'quanganhdo/grb256'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim'}

" Auto close pairs
NeoBundle 'Raimondi/delimitMate'

" Code commentary
NeoBundle 'tpope/vim-commentary' 

" End structures automatically
NeoBundle 'tpope/vim-endwise'    

" Git
NeoBundle 'tpope/vim-fugitive'   

" Dot commands for plugin maps
NeoBundle 'tpope/vim-repeat'     

" Unix shell commands
NeoBundle 'tpope/vim-eunuch'     

" Readline key bindings
NeoBundle 'tpope/vim-rsi'        

" Quoting/parenthesizing
NeoBundle 'tpope/vim-surround'   

" Change vim dir to project root
NeoBundle 'airblade/vim-rooter'  

" Text objects
NeoBundle 'matchit.zip'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

" Zoom in/out of buffer
NeoBundle 'ZoomWin'

" Golden ratio
NeoBundle 'roman/golden-ratio'

" Tmux fixes
NeoBundle 'sjl/vitality.vim'
NeoBundle 'tpope/vim-tbone'

" Indent code
NeoBundle 'godlygeek/tabular'

" Keep yanked stuff on a ring
NeoBundle 'YankRing.vim'

" SVN/Git changes on signs bar
NeoBundle 'mhinz/vim-signify'

" Undo tree
NeoBundle 'sjl/gundo.vim'

" Ruby/Rails stuff
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-bundler'

" C stuff
NeoBundle 'majutsushi/tagbar'

" Syntax checking
NeoBundle 'scrooloose/syntastic'

" Much faster than ctrlp
" Needs system ruby 
NeoBundle 'wincent/Command-T'

" Snipmate
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'garbas/vim-snipmate'

" WriteRoom inspired
NeoBundle 'mikewest/vimroom'

NeoBundleCheck
