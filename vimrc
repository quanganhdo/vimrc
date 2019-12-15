" vim:fdm=marker

" Behaviors {{{

set nocompatible                " choose no compatibility with legacy vi
filetype off

set shell=/bin/bash

" Neobundle
if filereadable($HOME . "/.bundle.vim")
	source $HOME/.bundle.vim
endif

" Sensible
runtime! plugin/sensible.vim

set fileencodings=ucs-bom,utf8,default,latin1
set encoding=utf-8

set wildmode=list:longest " complete files like a shell
set clipboard+=unnamed    " use the pasteboard as the default register
set hidden                " don't raise a warning when navigating away from a hidden buffer with unsaved changes
set visualbell            " no beeping
set virtualedit=block     " cursor can be positioned anywhere in Visual block mode
set autowriteall          " write file contents when moving to another file
set timeoutlen=1200       " more time for macros
set fillchars+=vert:\ ,fold:-
set history=10000
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set shiftround
set showcmd

" Mouse
set ttyfast
set mouse=nvi               " enable mouse usage in normal, visual, and insert mode
set ttymouse=xterm2

" C-a, C-x don't deal with hex
set nrformats=

" Faster drawing
set lazyredraw

" Split more sensibly
set splitbelow
set splitright         

"" Display
set showmode                    " display current mode
set cursorline                  " highlight current line
set cmdheight=2                 " command line height

"" Copy
set pastetoggle=<F2>

"" Wrapping
set wrap
set linebreak

" Backup files
set noswapfile

"" Whitespace
set tabstop=4                  " indentation every 4 cols
set shiftwidth=4               " indent of 4 spaces
set softtabstop=4              " backspaces delete indentation
set scrolloff=8                " around the cursor
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"" Searching
set hlsearch                    " highlight matches
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter          

"" Undo
set undodir=$HOME/.vim/tmp
set backupdir=$HOME/.vim/tmp
set undofile
set undolevels=1000         " number of undos 
set undoreload=10000        " number of lines to save for undo  

" }}}

" Mappings {{{

" Use space as :
nnoremap <space> :
vnoremap <space> :

" Use ! as :!
nnoremap ! :!
vnoremap ! :!

" Use , as <leader>
let mapleader = ","

" Dot selection
" Works with range
vnoremap . :norm.<cr>

" Switch between last 2 files
nnoremap <leader><leader> <c-^>

" Remove highlighting
nnoremap <leader><space> :noh<cr>

" Window handling
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-w>q

nnoremap <left> <C-w><
nnoremap <right> <C-w>>
nnoremap <up> <C-w>-
nnoremap <down> <C-w>+

" Move thru visual lines
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Use normal regex
nnoremap / /\v
vnoremap / /\v

" Quickly open a split
nnoremap yv :vnew<cr>

" Open/View files in same directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :<C-u>edit %%

" Indent/Unident
vnoremap > >gv
vnoremap < <gv
nmap <leader>V ggVG
nmap <leader>= msHmtgg=G'tzt`s

" }}}

" UI {{{

" base16
colorscheme base16-eighties
set background=dark

hi Search cterm=underline ctermfg=none ctermbg=none

" }}}

" Auto Commands {{{

"" Line number
if !exists("*SetLineNumber")
	function SetLineNumber()
		set relativenumber
		set number
	endfunction
endif

"" Statusline
if !exists("*SetFullStatusLine")
	function SetFullStatusLine()
		setl statusline=[%n]\ 
		setl statusline+=%{&paste?'*paste*\ ':''}
		setl statusline+=[
		setl statusline+=%F
		setl statusline+=%{&modified?'*':''}
		setl statusline+=]
		setl statusline+=%{&readonly?'\ (read-only)\ ':'\ '}\ 
		setl statusline+=%{strlen(&ft)?&ft:'none'}/
		setl statusline+=%{strlen(&syntax)?&syntax:'none'}\ \ 
		setl statusline+=%{&ff}/
		setl statusline+=%{strlen(&fenc)?&fenc:'none'}\ \ 
		setl statusline+=%=
		setl statusline+=%{fugitive#statusline()}\ \ 
		setl statusline+=\ %l,%c
		setl statusline+=/%L\ 
		setl statusline+=[%p%%]
	endfunction

	function SetShortStatusLine()
		setl statusline=[%n]\ 
		setl statusline+=[
		setl statusline+=%F
		setl statusline+=%{&modified?'*':''}
		setl statusline+=]
		setl statusline+=%=
		setl statusline+=%l
		setl statusline+=/%L\ 
		setl statusline+=[%p%%]
	endfunction
endif

if !exists("*ReloadVimrc")
	function ReloadVimrc()
		let l = line(".")
		let c = col(".")
		source $MYVIMRC
		call cursor(l, c)
	endfunction
endif

" Always open help in vertical split
aug helpfiles
	au!
	au BufRead,BufEnter */doc/* wincmd L
aug END

" Open .vimrc for quick editing
if !exists('*SplitIfNecessary')
	function SplitIfNecessary(file)
		if line('$') == 1 && getline(1) == ''
			exec 'e' a:file
		else
			exec 'vsp' a:file
		endif
	endfunction
endif
aug vimrc
	au!
	au! BufWritePost .vimrc :call ReloadVimrc()
	au! BufWritePost .bundle.vim :call ReloadVimrc()
aug END
nmap <leader>v :call SplitIfNecessary($MYVIMRC)<cr>
nmap <leader>b :call SplitIfNecessary("~/.bundle.vim")<cr>

aug allfiles
	au!

	" Save file on losing focus
	au FocusLost * :wa        

	" Relative number for current window only
	au WinEnter,BufEnter * :call SetLineNumber()
	au WinLeave,BufLeave * set norelativenumber

	" Different statuslines
	au WinEnter,BufEnter * :call SetFullStatusLine()
	au WinLeave,BufLeave * :call SetShortStatusLine()

	" Cursorline
	au WinEnter,BufEnter * setlocal cursorline
	au WinLeave,BufLeave * setlocal nocursorline

	" Jump to last cursor position 
	au BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
aug END

aug filetypes
	au!
	" Misc spacings
	au Filetype ruby,haml,yaml,html,javascript set ai ts=2 sts=2 sw=2
    au Filetype php set ai ts=4 sts=4 sw=4

	" Syntax highlighting
	au BufRead,BufNewFile *.hs set filetype=haskell
	au BufRead,BufNewFile *.java set filetype=java
	au BufRead,BufNewFile *.js set filetype=javascript
	au BufRead,BufNewFile *.php set filetype=php
	au BufRead,BufNewFile *.html,*.htm set filetype=html
	au BufRead,BufNewFile *.md,*.mdown,*.markdown set filetype=markdown
	au BufRead,BufNewFile *.rb set filetype=ruby
	au BufRead,BufNewFile *.vim,.vimrc,.gvimrc set filetype=vim
aug END

" }}}

" Plugins {{{

" vim-signify
let g:signify_vcs_list = ['git', 'svn']

" ZoomWin
nnoremap <leader>z :ZoomWin<cr>

" vimwiki
let g:vimwiki_list = [{'path': '/Users/anh/Library/Mobile Documents/com~apple~CloudDocs/vimwiki', 'ext': '.markdown' }]
nmap <Leader>wq <Plug>VimwikiVSplitLink

" }}}
