"" Behaviors
set nocompatible                " choose no compatibility with legacy vi
filetype off

" Neobundle
if filereadable($HOME . "/.bundle.vim")
	source $HOME/.bundle.vim
endif

" Sensible
runtime! plugin/sensible.vim

set wildmode=list:longest " complete files like a shell
set clipboard+=unnamed    " use the pasteboard as the default register
set hidden                " don't raise a warning when navigating away from a hidden buffer with unsaved changes
set visualbell            " no beeping
set virtualedit=block     " cursor can be positioned anywhere in Visual block mode
set autowriteall          " write file contents when moving to another file
set timeoutlen=1200       " more time for macros
set fillchars+=vert:\ ,fold:-
set history=10000
set relativenumber
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Mouse
set ttyfast
set mouse=nvi               " enable mouse usage in normal, visual, and insert mode
set ttymouse=xterm2

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

" Faster drawing
set lazyredraw

" Move between windows quickly
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-x> <C-w>x

" Close window
nnoremap <leader>w :bd<cr>

" Split more sensibly
set splitbelow
set splitright         

"" Display
set showmode                    " display current mode
set cursorline                  " highlight current line
set cmdheight=2                 " command line height

"" Copy
map <leader>y "*y
set pastetoggle=<F2>

"" Wrapping
set wrap

"" Scheme
set t_Co=256

" Tomorrow-Night w/ search term underlining
colorscheme Tomorrow-Night
highlight Search cterm=underline ctermfg=none ctermbg=none

highlight SignifySignAdd cterm=bold ctermbg=none ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=none ctermfg=227

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
set statusline+=%{strlen(&ft)?&ft:'none'}/
set statusline+=%{strlen(&syntax)?&syntax:'none'}\ \ 
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
set scrolloff=8                " around the cursor
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"" Statusline

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
aug helpfiles
	au!
	au BufRead,BufEnter */doc/* wincmd L
aug END

" Open .vimrc for quick editing
if !exists('*OpenInSplitIfNecessary')
	function OpenInSplitIfNecessary(file)
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
nmap <leader>v :call OpenInSplitIfNecessary($MYVIMRC)<cr>
nmap <leader>b :call OpenInSplitIfNecessary("~/.bundle.vim")<cr>

" Test
" http://www.oinksoft.com/blog/view/6/
let ft_stdout_mappings = {
			\'applescript': 'osascript',
			\'bash': 'bash',
			\'bc': 'bc',
			\'haskell': 'runghc',
			\'javascript': 'node',
			\'lisp': 'sbcl',
			\'nodejs': 'node',
			\'ocaml': 'ocaml',
			\'perl': 'perl',
			\'php': 'php',
			\'python': 'python',
			\'ruby': 'ruby',
			\'scheme': 'scheme',
			\'sh': 'sh',
			\'sml': 'sml',
			\'spice': 'ngspice'
			\}
for ft_name in keys(ft_stdout_mappings)
	execute 'autocmd Filetype ' . ft_name . ' nnoremap <buffer> <C-P> :write !'
			\. ft_stdout_mappings[ft_name] . '<CR>'
endfor

if !exists("*TurnOffNumber")
	function TurnOffNumber()
		set norelativenumber
		set number
	endfunction
endif
aug allfiles
	au!

	" Save file on losing focus
	au FocusLost * :wa        

	" Relative number for current window only
	au WinEnter * set relativenumber
	au WinLeave * :call TurnOffNumber()

	" Jump to last cursor position 
	au BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
aug END

aug filetypes
	au!
	" Misc spacings
	au Filetype ruby,haml,yaml,html,javascript set ai ts=2 sts=2 sw=2 et

	" Autocompletion
	au FileType python set omnifunc=pythoncomplete#Complete
	au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	au FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
	au FileType css set omnifunc=csscomplete#CompleteCSS
	au FileType xml set omnifunc=xmlcomplete#CompleteTags
	au FileType php set omnifunc=phpcomplete#CompletePHP
	au FileType c set omnifunc=ccomplete#Complete

	" Syntax highlighting
	au BufRead,BufNewFile *.java set filetype=java
	au BufRead,BufNewFile *.php set filetype=php
	au BufRead,BufNewFile *.rb set filetype=ruby
	au BufRead,BufNewFile *.vim,.vimrc,.gvimrc set filetype=vim
aug END

" Open/View files in same directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" Indent/Unident
vnoremap > >gv
vnoremap < <gv
nmap <leader>= gg=G

"" Plugins setup

" Unite
let g:unite_win_height = 10
let g:unite_split_rule = 'botright'
let g:unite_source_history_yank_enable = 2
let g:unite_enable_start_insert = 1
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts =
	\ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
	\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
	let g:unite_source_grep_recursive_opt = ''
endif

call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_hidden_files'])
nnoremap yf :<C-u>Unite -no-split -default-action=vsplit file_rec/async:!<cr>
nnoremap yb :<C-u>Unite buffer<cr>
nnoremap yt :<C-u>Unite tag<cr>
nnoremap yo :<C-u>Unite outline<cr>
nnoremap yg :<C-u>Unite grep:.<cr>
nnoremap yk :<C-u>Unite history/yank<cr>

" neocomplete 
let g:neocomplete#enable_at_startup = 3
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function()
	return pumvisible() ? neocomplete#close_popup() : "\<cr>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

" vim-rooter
let g:rooter_manual_only = 2

" tabular
nmap <leader>a" :Tabularize /"<cr>
vmap <leader>a" :Tabularize /"<cr>
nmap <leader>a= :Tabularize /=<cr>
vmap <leader>a= :Tabularize /=<cr>
nmap <leader>a: :Tabularize /:\zs<cr>
vmap <leader>a: :Tabularize /:\zs<cr>

" vim-signify
let g:signify_vcs_list = ['git', 'svn']

" tagbar
map <leader>t :TagbarToggle<cr>
map <leader>ts :TagbarOpen<cr>\|:TagbarShowTag<cr>
let g:tagbar_autoshowtag = 2

" syntastic
let g:syntastic_check_on_open = 3

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" undotree
nnoremap <leader>u :UndotreeToggle<cr>

" ZoomWin
nnoremap <leader>z :ZoomWin<cr>

" Vimfiler
map <C-n> :VimFilerExplorer<CR>
nmap - :VimFiler -find<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '^\%(.git\|.svn\|.DS_Store\)$'
let g:vimfiler_safe_mode_by_default = 0
