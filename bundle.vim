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
nnoremap <leader>a :Ack

" SuperTab
NeoBundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType        = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

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
let g:rooter_manual_only = 2

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
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Keep yanked stuff on a ring
NeoBundle 'YankRing.vim'
let g:yankring_history_dir="$HOME/.vim/tmp"

" SVN/Git changes on signs bar
NeoBundle 'mhinz/vim-signify'
let g:signify_vcs_list = ['git', 'svn']
highlight SignifySignAdd cterm=bold ctermbg=none ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=none ctermfg=227

" Undo tree
NeoBundle 'sjl/gundo.vim'

" Ruby/Rails stuff
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-bundler'

" C stuff
NeoBundle 'majutsushi/tagbar'
map <leader>t :TagbarToggle<CR>
map <leader>ts :TagbarOpen<CR>\|:TagbarShowTag<CR>
let g:tagbar_autoshowtag = 2

" Syntax checking
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open = 2

" Much faster than ctrlp
" Needs system ruby 
NeoBundle 'wincent/Command-T'
map <leader>f :CommandTFlush<CR>\|:CommandT<CR>
map <leader>ft :CommandTFlush<CR>\|:CommandTTag<CR>
map <leader>fb :CommandTFlush<CR>\|:CommandTBuffer<CR>
map <leader>fj :CommandTFlush<CR>\|:CommandTJump<CR>
map <leader>ff :CommandTFlush<CR>

" Snipmate
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'garbas/vim-snipmate'
:imap <C-y> <Plug>snipMateNextOrTrigger
:smap <C-y> <Plug>snipMateNextOrTrigger

" WriteRoom inspired
NeoBundle 'mikewest/vimroom'

NeoBundleCheck
