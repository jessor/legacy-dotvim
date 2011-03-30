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

set nocompatible
set nobackup
set ruler
set showcmd
set showmatch
set showmode
set title
set mouse=a
set cursorline

" overwrite default shiftwidth for ruby files
autocmd FileType ruby setlocal shiftwidth=2

" let's not store backup files in the project folder
silent execute '!mkdir -p ~/.vim_backups'
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//


" builtin bindings -----------------------------------------------------

" toggle autoindenting for pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" toggle linewrap
noremap <silent> <F3> :call ToggleWrap()<CR>

" toggle linenumbers
set number
nnoremap <F4> :call g:ToggleNuMode()<CR>

" toggle highlighting on/off, show current value.
:noremap <F7> :set hlsearch! hlsearch?<CR>

" copy selected text to clipboard with ^C
map <C -c> "+y

" convenience over simplicity
:command WQ wq
:command Wq wq
:command W w
:command Q q
ino ;; <Esc>


" plugins --------------------------------------------------------------

" plugins in bundle/
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

" gundo tree
nnoremap <F6> :GundoToggle<CR>


" style -----------------------------------------------------------------

" some color adjustments, tuned to go well with my termcolors:
" https://github.com/jessor/dotfiles/blob/master/Xdefaults
hi Cursor cterm=none ctermbg=darkyellow ctermfg=white
hi CursorLine cterm=NONE ctermbg=black
hi MatchParen cterm=underline ctermbg=black ctermfg=darkyellow
hi StatusLine cterm=none ctermbg=black ctermfg=darkyellow
hi TabLineSel cterm=none ctermbg=darkyellow ctermfg=white
hi Visual cterm=none ctermbg=darkyellow ctermfg=black
hi! link VertSplit StatusLine
hi! link StatusLineNC StatusLine
hi! link LineNr StatusLine
hi! link TabLineFill StatusLine
hi! link TabLine StatusLine
hi! link CursorColumn StatusLine
hi! link Search Visual


" functions -------------------------------------------------------------

function! g:ToggleNuMode()
	if(&rnu == 1)
		set nu
	else
		set rnu
	endif
endfunc

function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    call UnwrapIt()
  else
    echo "Wrap ON"
    call WrapIt()
  endif
endfunction

" https://github.com/hgimenez/vimfiles/blob/c07ac584cbc477a0619c435df26a590a88c3e5a2/vimrc#L72-122
function WrapIt()
  set wrap linebreak
  set virtualedit=
  set breakat=\ ^I!@*-+;:,./? " break at these characters (requires linbreak, see above)
  set showbreak=>             " character to show that a line is wrapped
  setlocal display+=lastline
  noremap  <buffer> <silent> k gk
  noremap  <buffer> <silent> j gj
  noremap  <buffer> <silent> <Up>   gk
  noremap  <buffer> <silent> <Down> gj
  noremap  <buffer> <silent> <Home> g<Home>
  noremap  <buffer> <silent> <End>  g<End>
  inoremap <buffer> <silent> <Up>   <C-o>gk
  inoremap <buffer> <silent> <Down> <C-o>gj
  inoremap <buffer> <silent> <Home> <C-o>g<Home>
  inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction

function UnwrapIt()
  set nowrap
  set virtualedit=all
  silent! nunmap <buffer> j
  silent! nunmap <buffer> k
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! nunmap <buffer> <Home>
  silent! nunmap <buffer> <End>
  silent! iunmap <buffer> <Up>
  silent! iunmap <buffer> <Down>
  silent! iunmap <buffer> <Home>
  silent! iunmap <buffer> <End>
endfunction

if &wrap
  call WrapIt()
endif


" gui ------------------------------------------------------------------

if has('gui_running')
	set guioptions-=T  " no toolbar
	colorscheme ir_black
	set guifont=Terminus\ 8
endif
