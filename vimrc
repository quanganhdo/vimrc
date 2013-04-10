"" Behaviors
set nocompatible                " choose no compatibility with legacy vi
filetype off

" Vundle 
if filereadable($HOME . "/.vundle.vim")
    source $HOME/.vundle.vim
endif

filetype plugin indent on       " load file type plugins + indentation

set encoding=utf-8              " utf-8 as default encoding 

set wildmenu                    " better command autocompletion
set wildmode=list:longest       " complete files like a shell

if $TMUX == ''
    set clipboard+=unnamed           " use the pasteboard as the default register
endif
" set autochdir                   " working directory is always the same as the file being edited
set hidden                      " don't raise a warning when navigating away from a hidden buffer with unsaved changes
au FocusLost * :wa              " save file on losing focus

set mouse=a                     " enable mouse usage

set visualbell                  " no beeping

set virtualedit=all             " cursor can be positioned anywhere

set history=1000

set number

" Use , as <leader>
let mapleader = ","

" Use jj as Esc
inoremap jj <esc>

" ; at EOL
inoremap ; <C-o>A;

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

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

"" Display
set showcmd                     " display incomplete commands
set showmode                    " display current mode
set cursorline                  " highlight current line
set ruler                       " display cursor position
set laststatus=2                " always show statusline
set showmatch                   " show matching parentheses
set cmdheight=2                 " command line height

"" Wrapping
set wrap
set linebreak 

"" Scheme
syntax enable
" if has('gui_running')
    " set background=light
" else
set background=dark
" endif

"" Whitespace
set tabstop=4                   " indentation every 4 cols
set shiftwidth=4                " indent of 4 spaces
set softtabstop=4               " backspaces delete indentation
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set scrolloff=3                 " show 3 lines of context around the cursor
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter          

" Use normal regex
nnoremap / /\v
vnoremap / /\v

" Backup files
try
    set backupdir=~/.vim/tmp
    set undodir=~/.vim/tmp
    set undofile                    " create files containing undo info so that previous actions can be undone
catch
endtry

"" Plugin setup

" Ack
nnoremap <leader>a :Ack

" Remove highlighting
nnoremap <leader><space> :noh<cr> 

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Gundo
nnoremap <F6> :GundoToggle<CR>

" NERDTree
map <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen=1        " close NERDTree after opening a file
let NERDTreeChDirMode=0         " never change CWD
let NERDTreeShowBookmarks=1     " display bookmark table

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" ctrlp
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
