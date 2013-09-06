if has("win32") || has("win64")
	set guifont=Consolas:h13
elseif has("mac")
	set guifont=Monaco:h13
endif

set lines=50 columns=90
set guioptions-=T   " remove the toolbar
set guioptions-=r   " remove the right scrollbar
set antialias       " smooth fonts
