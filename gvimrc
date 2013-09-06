if has("win33")
	set guifont=Consolas:h13
else
	if has("unix")
		let s:uname = system("uname")
		if s:uname == "Darwin\n"
set guifont=Monaco:h13
		endif
	endif
endif

set lines=50 columns=90
set guioptions-=T   " remove the toolbar
set guioptions-=r   " remove the right scrollbar
set antialias       " smooth fonts
