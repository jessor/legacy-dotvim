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
set nobackup
set ruler
set showcmd
set showmatch
set showmode
set title
set mouse=a

" toggle autoindenting for pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" toggle linewrap
map <F3> :set nowrap!<CR>

" toggle linenumbers
set number
nnoremap <F4> :call g:ToggleNuMode()<CR>


" plugins in bundle/ ---------------------------------------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" plugins --------------------------------------------------------------

" NERDTree 
:nmap <F8> :NERDTreeToggle<CR>

" vim-buftabs
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>

" taglist
nnoremap <silent> <F9> :TlistToggle<CR>

" themes ----------------------------------------------------------------

"colorscheme ir_black
"hi CursorLine cterm=NONE ctermbg=black 
"hi MatchParen cterm=NONE ctermbg=white ctermfg=black


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

function! g:ToggleNuMode()
	if(&rnu == 1)
		set nu
	else
		set rnu
	endif
endfunc


" gui ------------------------------------------------------------------

if has('gui_running')
	set guioptions-=T  " no toolbar
	colorscheme ir_black
	set guifont=Terminus\ 8
endif
