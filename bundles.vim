" Core
set nocompatible
filetype off

" no syntax hilight on my mac os x setup without resetting this:
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Plugins!
Bundle 'mbbill/undotree'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/Diablo3'
Bundle 'vim-scripts/Lucius'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-haml'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'jessor/Darkmate'
Bundle 'chriskempson/tomorrow-theme', {'rtp':'vim/'}
Bundle 'Lokaltog/vim-powerline'
Bundle 'gmarik/sudo-gui.vim'
"Bundle 'evidens/vim-twig'
Bundle 'majutsushi/tagbar'
"Bundle 'dsawardekar/wordpress.vim'
"Bundle 'vim-scripts/po.vim--Jelenak'
"Bundle 'kien/ctrlp.vim'
