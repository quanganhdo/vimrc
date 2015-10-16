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

" Indent code
NeoBundle 'junegunn/vim-easy-align'

" Theme
NeoBundle 'chriskempson/base16-vim'

" }}}

" IDE {{{

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

" Git
NeoBundle 'tpope/vim-fugitive'   

" File browser
NeoBundle 'Shougo/vimfiler.vim', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'commands': ['VimFiler', 'VimFilerExplorer']
			\ }}

" Change vim dir to project root
NeoBundle 'airblade/vim-rooter'  

" Zoom in/out of buffer
NeoBundle 'ZoomWin'

" SVN/Git changes on signs bar
NeoBundle 'mhinz/vim-signify'

" Undo tree
NeoBundle 'mbbill/undotree', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'commands': 'UndotreeToggle',
			\ }}

" }}}

" Syntax {{{

" Syntax checking
NeoBundle 'scrooloose/syntastic'

" Consistent coding style
NeoBundle 'editorconfig/editorconfig-vim'

" C stuff
NeoBundle 'majutsushi/tagbar'

" Ruby stuff
NeoBundle 'vim-ruby/vim-ruby', {
			\ 'lazy': 1,
			\ 'autoload': {
			\	'filetypes': 'ruby',
			\ }}

" Rails stuff
" This relies on vim-surround
NeoBundle 'tpope/vim-rails' 

" HTML stuff
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
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

" List all mappings
NeoBundle 'listmaps.vim', {
			\ 'lazy': 1,
			\ }

" }}}

" Go {{{

NeoBundleCheck

call neobundle#end()

" }}}
