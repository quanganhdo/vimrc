"" Behaviors
set nocompatible                " choose no compatibility with legacy vi

" Pathogen
" execute pathogen#infect()
" silent! call pathogen#helptags()

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Kick off Vundle
Bundle 'gmarik/vundle'

Bundle 'a.vim'
Bundle 'mileszs/ack.vim'
Bundle 'bufexplorer.zip'
Bundle 'Gundo'
Bundle 'matchit.zip'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
Bundle 'SuperTab'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'twe4ked/vim-peepopen'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-surround'
Bundle 'ZoomWin'

set encoding=utf-8              " utf-8 as default encoding 

filetype plugin indent on       " load file type plugins + indentation

set wildmenu                    " better command autocompletion
set wildmode=list:longest       " complete files like a shell

set clipboard=unnamed           " use the pasteboard as the default register
set autochdir                   " working directory is always the same as the file being edited
set undofile                    " create files containing undo info so that previous actions can be undone
set hidden                      " handle multiple buffers better
au FocusLost * :wa              " save file on losing focus

set mouse=a                     " enable mouse usage

set visualbell                  " no beeping

set history=1000

" Use , as <leader>
let mapleader = ","

" Use jj as Esc
inoremap jj <esc>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"" Display
set showcmd                     " display incomplete commands
set showmode                    " display current mode
set cursorline                  " highlight current line
set ruler                       " display cursor position
set laststatus=2                " always show statusline
set showmatch                   " show matching parentheses

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
colorscheme solarized

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
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
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
