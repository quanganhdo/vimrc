"" Behaviors
set nocompatible                " choose no compatibility with legacy vi
filetype off

" Vundle 
if filereadable($HOME . "/.vundle.vim")
    source $HOME/.vundle.vim
endif

filetype plugin indent on       " load file type plugins + indentation

set encoding=utf-8        " utf-8 as default encoding
set wildmenu              " better command autocompletion
set wildmode=list:longest " complete files like a shell
set clipboard+=unnamed    " use the pasteboard as the default register
set hidden                " don't raise a warning when navigating away from a hidden buffer with unsaved changes
set mouse=a               " enable mouse usage
set visualbell            " no beeping
set virtualedit=all       " cursor can be positioned anywhere
set history=10000
set autoindent
set number

" Use , as <leader>
let mapleader = ","

" Use jj as Esc
inoremap jj <esc>

" ; at EOL
inoremap ; <C-o>A;

" Switch between last 2 files
nnoremap <leader><leader> <c-^>

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
set expandtab                   " use spaces, not tabs (optional)
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

" Tab to indent/autocomplete
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

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

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><space> :noh<cr> 

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

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
map <leader>f :CtrlP<CR>
map <leader>ft :CtrlPBufTag<CR>
map <leader>fb :CtrlPBuffer<CR>
let g:ctrlp_max_height = 10
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

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

" vim-easytags
let g:easytags_file = '$HOME/.vim/tags'
