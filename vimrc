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
set virtualedit=all       " cursor can be positioned anywhere
set history=10000
set autoindent
set number
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slight delay after pressing ESC then O

" Mouse
set ttyfast
set mouse=a               " enable mouse usage
set ttymouse=xterm2

" Use , as <leader>
let mapleader = ","

" Use jj as Esc
inoremap jj <esc>

" ; at EOL
inoremap ; <C-o>A;

" Switch between last 2 files
nnoremap <leader><leader> <c-^>

" Allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
cnoremap <C-N>      <End>
cnoremap <C-P>      <Up>
cnoremap <ESC>b     <S-Left>
cnoremap <ESC><C-B> <S-Left>
cnoremap <ESC>f     <S-Right>
cnoremap <ESC><C-F> <S-Right>
cnoremap <ESC><C-H> <C-W>

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

"" Scroll down
noremap <Space> <PageDown>

"" Wrapping
set wrap
set linebreak 

"" Scheme
syntax enable
set background=dark

"" Statusline
set statusline=[
set statusline+=%F
set statusline+=%{&modified?'*':''}
set statusline+=]
set statusline+=%{&readonly?'\ (read-only)\ ':'\ '}
set statusline+=%{strlen(&ft)?&ft:'<none>'}\ \ 
set statusline+=%{&ff}\ \ 
set statusline+=%{strlen(&fenc)?&fenc:'none'}\ \ 
set statusline+=%=
set statusline+=col\ %c\ \ 
set statusline+=line\ %l\ 
set statusline+=of\ %L\ 
set statusline+=[%p%%]

"" Whitespace
set tabstop=4                   " indentation every 4 cols
set shiftwidth=4                " indent of 4 spaces
set softtabstop=4               " backspaces delete indentation
set backspace=indent,eol,start  " backspace through everything in insert mode
set scrolloff=8                 " around the cursor
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

autocmd! BufWritePost .vimrc :call ReloadVimrc()
nmap <Leader>v :vsp $MYVIMRC<CR>

"" AutoCmds
au FocusLost * :wa              " save file on losing focus

" Line number for active file only
au WinEnter * :setlocal number
au WinLeave * :setlocal nonumber

" Jump to last cursor position 
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
autocmd Filetype ruby,haml,yaml,html,javascript set ai ts=2 sts=2 sw=2 et

" Syntax highlighting
autocmd BufRead,BufNewFile *.java set filetype=java

" Rename file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

"" Plugin setup

" Ack
nnoremap <leader>a :Ack

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Supertab
let g:SuperTabDefaultCompletionType        = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" AutoComplPop
let g:acp_ignorecaseOption        = 1
let g:acp_behaviorJavaEclimLength = 3
if !exists("*MeetsForJavaEclim")
  function MeetsForJavaEclim(context)
    return g:acp_behaviorJavaEclimLength >= 0 &&
          \ a:context =~ '\k\.\k\{' . g:acp_behaviorJavaEclimLength . ',}$'
  endfunction
endif
let g:acp_behavior = {
    \ 'java': [{
      \ 'command': "\<c-x>\<c-u>",
      \ 'completefunc' : 'eclim#java#complete#CodeComplete',
      \ 'meets'        : 'MeetsForJavaEclim',
    \ }]
  \ }

" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" ctrlp
map <leader>f :CtrlP<CR>
map <leader>ft :CtrlPBufTag<CR>
map <leader>fb :CtrlPBuffer<CR>
map <leader>fm :CtrlPMRU<CR>
let g:ctrlp_max_height            = 10
let g:ctrlp_working_path_mode     = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore         = '\v[\/]\.(git|hg|svn)$'

" YankRing
let g:yankring_history_dir="$HOME/.vim/tmp"

" vim-signify
let g:signify_vcs_list                  = ['git', 'svn']
let g:signify_sign_color_ctermfg_add    = 2
let g:signify_sign_color_ctermfg_delete = 1
let g:signify_sign_color_ctermfg_change = 3
let g:signify_sign_color_ctermbg        = 0

" Hack for Colorized
highlight clear SignColumn

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
