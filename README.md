my cozy vim config ^_^
======================

uses gmarik/vundle to manage plugins, plugin list in bundles.vim


download, setup:
----------------

    cd ~/code
    git clone git://github.com/jessor/vim-setup-jessor.git
    cd vim-setup-jessor
    git clone git://github.com/VundleVim/Vundle.vim bundle/vundle
    vim -u bundles.vim +BundleInstall +qall
    cd ~
    ln -s ~/code/vim-setup-jessor .vim
    ln -s ~/.vim/.vimrc


bindings
--------

insert mode:

* F2  - toggle mode keeping the original indentation when pasting


normal mode:

* F1 - switch to previous buffer
* F2 - switch to next buffer
* F3 - toggles word wrapping
* F5 - toggle Indentline
* F6 - toggle UndoTree
* F7 - toggle hilighting of search results
* F8 - toggle NERDTree
* F9 - toggle Tagbar
