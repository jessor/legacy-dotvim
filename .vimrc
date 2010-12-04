syntax on
filetype on
filetype plugin on
filetype indent on


set history=40
set encoding=utf-8

set autoindent
set expandtab "insert spaces instead of tabs
set scrolloff=3
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4
"set tw=80

set nocompatible
"set number
set nobackup
set ruler
set showcmd
set showmatch
set showmode
set title
set mouse=a

" Cursorline
set cursorline
hi CursorLine   cterm=NONE ctermbg=black 

au BufRead /tmp/mutt-* set tw=72


" plugins --------------------------------------------------------------

" NERDTree 
:nmap <F8> :NERDTreeToggle<CR>
" vim-buftabs
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>


" functions -------------------------------------------------------------

function! CheckForShebang()
	if (match( getline(1) , '^\#!') == 0)
		map <F5> :!./%<CR>
		:!./%
	else
		unmap <F%>
	endif
endfunction
map <F5> :call CheckForShebang()<CR>


" gui ------------------------------------------------------------------

if has('gui_running')
	set guioptions-=T  " no toolbar
	colorscheme ir_black
	set guifont=Terminus\ 8
endif

