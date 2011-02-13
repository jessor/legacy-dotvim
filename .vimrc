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

" toggle indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkyellow
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
map <F5> :IndentGuidesToggle<CR>


" themes ----------------------------------------------------------------

" some color adjustments, tuned to go well with my termcolors:
" https://github.com/jessor/dotfiles/blob/master/Xdefaults
hi Cursor cterm=none ctermbg=darkyellow ctermfg=white
hi Visual cterm=none ctermbg=darkyellow ctermfg=black
hi StatusLine cterm=none ctermbg=black ctermfg=darkyellow
hi TabLineSel cterm=none ctermbg=darkyellow ctermfg=white
hi MatchParen cterm=underline ctermbg=black ctermfg=darkyellow
hi! link VertSplit StatusLine
hi! link StatusLineNC StatusLine
hi! link LineNr StatusLine
hi! link TabLineFill StatusLine
hi! link TabLine StatusLine
hi! link CursorColumn StatusLine
hi! link CursorLine StatusLine

" functions -------------------------------------------------------------

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
