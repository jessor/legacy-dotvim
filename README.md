my vim config =)
================

used mainly for rails development. plugins are git submodules where possible, thanks to [pathogen](https://github.com/tpope/vim-pathogen).


download:
---------

    cd ~/code
    git clone git://github.com/jessor/vim-setup-jessor.git
    cd vim-setup-jessor
    git submodule update --init


install:
--------

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
* F4 - toggles line number display
* F5 - toggle indent-guides
* F6 - toggle Gundo undo tree
* F7 - toggle hilighting of all search results in document
* F8 - toggles NERDTree
* F9 - toggles Taglist (shows an index of functions and variables in the buffer)
