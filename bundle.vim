" vim:fdm=marker

" Setup {{{
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" }}}

" Essentials {{{

" Sensible
NeoBundle 'tpope/vim-sensible'

" Auto close pairs
NeoBundle 'Raimondi/delimitMate', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'insert': 1,
			\ }}

" Code commentary
NeoBundle 'tpope/vim-commentary' 

" End structures automatically
NeoBundle 'tpope/vim-endwise', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'insert': 1,
			\ }}

" Handy mappings
NeoBundle 'tpope/vim-unimpaired'

" Dot commands for plugin maps
NeoBundle 'tpope/vim-repeat'     

" Readline key bindings
NeoBundle 'tpope/vim-rsi'        

" Quoting/parenthesizing
NeoBundle 'tpope/vim-surround'   

" Text objects
NeoBundle 'matchit.zip'
NeoBundle 'wellle/targets.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'vim-scripts/argtextobj.vim'
NeoBundle 'nelstrom/vim-textobj-rubyblock', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'filetypes': 'ruby',
			\ }}

" Theme
NeoBundle 'danielwe/base16-vim'

" }}}

" Utils {{{

" Git
NeoBundle 'tpope/vim-fugitive'   

" Zoom in/out of buffer
NeoBundle 'ZoomWin'

" SVN/Git changes on signs bar
NeoBundle 'mhinz/vim-signify'

" }}}

" Syntax {{{

NeoBundle 'tpope/vim-markdown', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'filetypes': 'markdown',
			\ }}

" }}}

" Miscellaneous {{{

" Unix shell commands
NeoBundle 'tpope/vim-eunuch'     

" iTerm2/Tmux fixes
NeoBundle 'sjl/vitality.vim'
NeoBundle 'tpope/vim-tbone'

" Wiki
NeoBundle 'vimwiki/vimwiki'

" }}}

" Go {{{

NeoBundleCheck

call neobundle#end()

" }}}
