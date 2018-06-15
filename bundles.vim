" Core
set nocompatible
filetype off

" no syntax hilight on my mac os x setup without resetting this:
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'mbbill/undotree'
Plugin 'vim-scripts/matchit.zip'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-haml'
Plugin 'yggdroot/indentline'
Plugin 'jessor/Darkmate'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-markdown'
Plugin 'ervandew/supertab'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'

Plugin 'chriskempson/base16-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'stanangeloff/php.vim'
Plugin '2072/PHP-Indenting-for-VIm'

"Plugin 'vim-scripts/Diablo3'
"Plugin 'vim-scripts/Lucius'
"Plugin 'chriskempson/tomorrow-theme', {'rtp':'vim/'}
"Plugin 'valloric/youcompleteme'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'tpope/vim-rails'
"Plugin 'gmarik/sudo-gui.vim'
"Plugin 'evidens/vim-twig'
"Plugin 'vim-scripts/po.vim--Jelenak'

call vundle#end()
filetype plugin indent on
