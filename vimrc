"" Behaviors
set nocompatible                " choose no compatibility with legacy vi
filetype off

" Vundle 
if filereadable($HOME . "/.vundle.vim")
    source $HOME/.vundle.vim
endif

filetype plugin indent on       " load file type plugins + indentation

if $SHELL =~ 'bin/fish'
	set shell=/bin/sh
endif

set encoding=utf-8        " utf-8 as default encoding
set wildmenu              " better command autocompletion
set wildmode=list:longest " complete files like a shell
set clipboard+=unnamed    " use the pasteboard as the default register
set hidden                " don't raise a warning when navigating away from a hidden buffer with unsaved changes
set visualbell            " no beeping
set virtualedit=block     " cursor can be positioned anywhere in Visual block mode
set autoread              " automatically reload files changed outside of Vim
set autowriteall          " write file contents when moving to another file
set timeoutlen=1200       " more time for macros
set ttimeoutlen=50        " faster Esc
set fillchars+=vert:\ ,fold:-
set history=10000
set autoindent
set relativenumber
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Mouse
set ttyfast
set mouse=nvi               " enable mouse usage in normal, visual, and insert mode
set ttymouse=xterm2

" Use , as <leader>
let mapleader = ","

" Dot selection
vnoremap . :norm.<cr>

" Switch between last 2 files
nnoremap <leader><leader> <c-^>

" Remove highlighting
nnoremap <leader><space> :noh<cr>

" Move between windows quickly
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
set splitbelow
set splitright         

"" Display
set showcmd                     " display incomplete commands
set showmode                    " display current mode
set cursorline                  " highlight current line
set ruler                       " display cursor position
set laststatus=2                " always show statusline
set showmatch                   " show matching parentheses
set cmdheight=2                 " command line height

"" Copy
map <leader>y "*y
set pastetoggle=<F2>

"" Wrapping
set wrap

"" Scheme
syntax enable
set t_Co=256

" Tomorrow-Night
colorscheme Tomorrow-Night
highlight Search cterm=underline ctermfg=none ctermbg=none

" GRB256
" colorscheme grb256

" Solarized 
" colorscheme solarized
" highlight clear SignColumn
" set background=dark

"" Statusline
set statusline=[%n]\ 
set statusline+=%{&paste?'*paste*\ ':''}
set statusline+=[
set statusline+=%F
set statusline+=%{&modified?'*':''}
set statusline+=]
set statusline+=%{&readonly?'\ (read-only)\ ':'\ '}\ 
set statusline+=%{strlen(&ft)?&ft:'<none>'}\ \ 
set statusline+=%{&ff}/
set statusline+=%{strlen(&fenc)?&fenc:'none'}\ \ 
set statusline+=%=
set statusline+=%{tagbar#currenttag('[%s]','')}\ \ 
set statusline+=%{fugitive#statusline()}\ \ 
set statusline+=\ %l,%c
set statusline+=/%L\ 
set statusline+=[%p%%]

"" Whitespace
set tabstop=4                  " indentation every 4 cols
set shiftwidth=4               " indent of 4 spaces
set softtabstop=4              " backspaces delete indentation
set shiftround                 " round indent to multiple of shiftwidth
set backspace=indent,eol,start " backspace through everything in insert mode
set scrolloff=8                " around the cursor
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"" Statusline

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter          

"" Undo
set undodir=$HOME/.vim/tmp
set backupdir=$HOME/.vim/tmp
set undofile
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo  

" Use normal regex
nnoremap / /\v
vnoremap / /\v

" Backup files
set noswapfile

if !exists("*ReloadVimrc")
	function ReloadVimrc()
		let l = line(".")
		let c = col(".")
		source $MYVIMRC
		call cursor(l, c)
	endfunction
endif

" Always open help in vertical split
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END

" Open .vimrc for quick editing
autocmd! BufWritePost .vimrc :call ReloadVimrc()
autocmd! BufWritePost .vundle.vim :call ReloadVimrc()
nmap <Leader>v :vsp $MYVIMRC<CR>
nmap <Leader>b :vsp $HOME/.vundle.vim<CR>

"" AutoCmds
au FocusLost * :wa              " save file on losing focus

" Relative number for current window only
if !exists("*TurnOffNumber")
    function TurnOffNumber()
        set number
        set nonumber
    endfunction
endif
au WinEnter * set relativenumber
au WinLeave * :call TurnOffNumber()

" Jump to last cursor position 
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
autocmd Filetype ruby,haml,yaml,html,javascript set ai ts=2 sts=2 sw=2 et

" Autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Syntax highlighting
autocmd BufRead,BufNewFile *.java set filetype=java

" Open/View files in same directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>e :edit %%

" Indent/Unident
vnoremap > >gv
vnoremap < <gv
nmap <Leader>= gg=G

"" Plugin setup

" Ack
nnoremap <leader>a :Ack

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Supertab
let g:SuperTabDefaultCompletionType        = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Tabular
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" CommandT
map <leader>f :CommandTFlush<CR>\|:CommandT<CR>
map <leader>ft :CommandTFlush<CR>\|:CommandTTag<CR>
map <leader>fb :CommandTFlush<CR>\|:CommandTBuffer<CR>
map <leader>fj :CommandTFlush<CR>\|:CommandTJump<CR>
map <leader>ff :CommandTFlush<CR>

" TagBar
map <leader>t :TagbarToggle<CR>
map <leader>ts :TagbarOpen<CR>\|:TagbarShowTag<CR>
let g:tagbar_autoshowtag = 1

" YankRing
let g:yankring_history_dir="$HOME/.vim/tmp"

" vim-signify
let g:signify_vcs_list                  = ['git', 'svn']
let g:signify_sign_color_ctermfg_add    = 2
let g:signify_sign_color_ctermfg_delete = 1
let g:signify_sign_color_ctermfg_change = 3
let g:signify_sign_color_ctermbg        = 0

" Syntastic
let g:syntastic_check_on_open = 1
" let g:syntastic_auto_loc_list = 1

" Rooter
let g:rooter_manual_only = 1

" Snipmate
:imap <C-y> <Plug>snipMateNextOrTrigger
:smap <C-y> <Plug>snipMateNextOrTrigger
