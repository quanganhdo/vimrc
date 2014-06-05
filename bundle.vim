" Kick off 
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Sensible
NeoBundle 'tpope/vim-sensible'

" Unite
NeoBundle 'Shougo/vimproc', {
			\ 'build' : {
			\	 'windows' : 'make -f make_mingw32.mak',
			\    'cygwin' : 'make -f make_cygwin.mak',
			\    'mac' : 'make -f make_mac.mak',
			\    'unix' : 'make -f make_unix.mak',
			\ }}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tsukkee/unite-tag', {
			\ 'lazy': 1,
			\ 'depends': 'Shougo/unite.vim',
			\ 'autoload': {
			\	'unite_sources': ['tag', 'tag/file', 'tag/include']
			\ }}
NeoBundle 'tsukkee/unite-help', {
			\ 'lazy': 1,
			\ 'depends': 'Shougo/unite.vim',
			\ 'autoload': {
			\	'unite_sources': 'help',
			\ }}
NeoBundle 'h1mesuke/unite-outline', {
			\ 'lazy': 1,
			\ 'depends': 'Shougo/unite.vim',
			\ 'autoload': {
			\	'unite_sources': 'outline',
			\ }}

" Neocomplete (if_lua support)
NeoBundle 'Shougo/neocomplete.vim' 

" Snippets
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

" Theme
NeoBundle 'chriskempson/base16-vim'

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

" Git
NeoBundle 'tpope/vim-fugitive'   

" File browser
NeoBundle 'Shougo/vimfiler.vim', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'commands': 'VimFilter',
			\ }}

" Dot commands for plugin maps
NeoBundle 'tpope/vim-repeat'     

" Unix shell commands
NeoBundle 'tpope/vim-eunuch'     
NeoBundle 'sjl/clam.vim', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'commands': ['Clam', 'ClamVisual'],
			\ }}

" Readline key bindings
NeoBundle 'tpope/vim-rsi'        

" Quoting/parenthesizing
NeoBundle 'tpope/vim-surround'   

" Change vim dir to project root
NeoBundle 'airblade/vim-rooter'  

" Text objects
NeoBundle 'matchit.zip'
NeoBundle 'welle/targets.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'filetypes': 'ruby',
			\ }}

" Zoom in/out of buffer
NeoBundle 'ZoomWin'

" iTerm2/Tmux fixes
NeoBundle 'sjl/vitality.vim'
NeoBundle 'tpope/vim-tbone'

" Indent code
NeoBundle 'junegunn/vim-easy-align'

" SVN/Git changes on signs bar
NeoBundle 'mhinz/vim-signify'

" Undo tree
NeoBundle 'mbbill/undotree', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'commands': 'UndotreeToggle',
			\ }}

" Syntax checking
NeoBundle 'scrooloose/syntastic'

" C stuff
NeoBundle 'majutsushi/tagbar'

" Ruby stuff
NeoBundle 'vim-ruby/vim-ruby', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'filetypes': 'ruby',
			\ }}

" HTML stuff
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim'}
NeoBundle 'xsbeats/vim-blade', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'filetypes': 'blade',
			\ }}
NeoBundle 'mustache/vim-mustache-handlebars', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'filetypes': 'html',
			\ }}
NeoBundle 'jelera/vim-javascript-syntax', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'filetypes': 'javascript',
			\ }}

" Utilities
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'listmaps.vim', {
			\ 'lazy': 1,
			\ }
NeoBundle 'editorconfig/editorconfig-vim'

" Yay
NeoBundleCheck
