syntax on
filetype on
filetype plugin on
filetype indent on
au BufNewFile,BufRead *.ctp set filetype=php

set history=40
set encoding=utf-8

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab "insert spaces instead of tabs
set autoindent
set scrolloff=3
set smartindent

set nocompatible
set nobackup
set ruler
set showcmd
set showmatch
set showmode
set title
set mouse=a
set cursorline
set number

" overwrite default shiftwidth for ruby files
autocmd FileType ruby setlocal shiftwidth=2

" let's not store backup files in the project folder
silent execute '!mkdir -p ~/.vim_backups'
set backupdir=~/.vim_backups/
set directory=~/.vim_backups/


" builtin bindings -----------------------------------------------------

" toggle autoindenting for pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" toggle linewrap
noremap <silent> <F3> :call ToggleWrap()<CR>

" toggle highlighting on/off, show current value.
:noremap <F7> :set hlsearch! hlsearch?<CR>
set hlsearch! " default: on

" copy selected text to clipboard with ^C
map <C -c> "+y

" paste register to end of line with ,
:nmap , $p

" press \vs to split file in multiple columns, Ctrl-W o to go back to a single
" window. http://vim.wikia.com/wiki/View_text_file_in_two_columns
:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" convenience over simplicity
:command WQ wq
:command Wq wq
:command Wqa wqa
:command W w
:command Q q
ino ;; <Esc>

" surround highlighted text with paranthesis
xnoremap <leader>s xi()<Esc>P


" plugins --------------------------------------------------------------

" Vundle
source ~/.vim/bundles.vim

" NERDTree 
:nmap <F8> :NERDTreeToggle<CR>
" open current directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" automatically open files in new tab
let NERDTreeMapOpenInTab='<ENTER>'

" vim-buftabs
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>

" taglist
nnoremap <silent> <F9> :TagbarToggle<CR>

" Indent Lines
map <F5> :IndentLinesToggle<CR>
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_setColors = 0

" Undotree
nnoremap <F6> :UndotreeToggle<CR>

if has("persistent_undo")
    set undodir=~/.vim_backups/
    set undofile
endif

" testing, reverse join lines ;)
nnoremap <C-J> ciW<CR><Esc>:if match( @", "^\\s*$") < 0<Bar>exec "norm P-$diw+"<Bar>endif<CR>


" functions -------------------------------------------------------------

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
 
function NoMoreUmlauts()
  if search ("ä") | :1,$s/ä/\&auml;/g | endif
    if search ("Ä") | :1,$s/Ä/\&Auml;/g | endif
    if search ("ö") | :1,$s/ö/\&ouml;/g | endif
    if search ("Ö") | :1,$s/Ö/\&Ouml;/g | endif
    if search ("ü") | :1,$s/ü/\&uuml;/g | endif
    if search ("Ü") | :1,$s/Ü/\&Uuml;/g | endif
    if search ("ß") | :1,$s/ß/\&szlig;/g | endif
endfunction


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

if has('gui_running')
	set guioptions-=T  " no toolbar
	set guifont="Menlo Regular":h13
endif

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
colorscheme one


" Lightline
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
  \ }
