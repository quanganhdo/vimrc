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
augroup helpfiles
	au!
	au BufRead,BufEnter */doc/* wincmd L
augroup END

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
autocmd! BufWritePost .vimrc :call ReloadVimrc()
autocmd! BufWritePost .bundle.vim :call ReloadVimrc()
nmap <Leader>v :call OpenInSplitIfNecessary($MYVIMRC)<CR>
nmap <Leader>b :call OpenInSplitIfNecessary("~/.bundle.vim")<CR>

" Reload file
nmap <Leader>r :e<CR>

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

" Misc spacings
autocmd Filetype ruby,haml,yaml,html,javascript set ai ts=2 sts=2 sw=2 et

" Autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Syntax highlighting
autocmd BufRead,BufNewFile *.java set filetype=java
autocmd BufRead,BufNewFile *.vim set filetype=vim

" Open/View files in same directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>e :edit %%

" Indent/Unident
vnoremap > >gv
vnoremap < <gv
nmap <Leader>= gg=G

" Toggle listchars
nmap <leader>l :set list!<CR>

"" Plugins setup

let g:unite_win_height = 10
let g:unite_split_rule = 'botright'
let g:unite_source_history_yank_enable = 2

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <Leader>f :<C-u>Unite -auto-preview -start-insert -default-action=vsplit file_rec/async:!<CR>
nnoremap <Leader>ff :<C-u>Unite -auto-preview file<CR>
nnoremap <Leader>fb :<C-u>Unite -auto-preview buffer<CR>
nnoremap <Leader>ft :<C-u>Unite -auto-preview tag<CR>
nnoremap <Leader>fo :<C-u>Unite -auto-preview outline<CR>
nnoremap <Leader>a :<C-u>Unite grep:.<CR>
nnoremap <Leader>yr :<C-u>Unite history/yank<CR>

let g:neocomplete#enable_at_startup = 3
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:rooter_manual_only = 2

nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

let g:signify_vcs_list = ['git', 'svn']

map <leader>t :TagbarToggle<CR>
map <leader>ts :TagbarOpen<CR>\|:TagbarShowTag<CR>
let g:tagbar_autoshowtag = 2

let g:syntastic_check_on_open = 3

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

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'auto_export': 1, 'syntax': 'markdown', 'ext': '.md'}]
