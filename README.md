nvim-config
===========

This repository contains my configuration files for the [Neovim] editor.

I still use standard Vim on some computers and want to maintain as much
consistency as possible, so my Neovim config is built on top of my [Vim
config].

The code in this repository just loads my standard Vim config, then adds some
Neovim specific bits and pieces.

If you find yourself wondering how something works, check the message of the
commit that added it (e.g. with `git log -S`). I like to leave "future me"
notes on why things are the way they are, so my commit history often contains
links to blog posts, training courses, etc.

# Setup

To get it running, I essentially do this:

    $ mkdir ~/Projects
    $ git clone --recurse-submodules \
        https://github.com/gma/dotvim.git Projects/dotvim
    $ git clone --recurse-submodules \
        https://github.com/gma/nvim-config.git Projects/nvim-config
    $ ln -s ~/Projects/dotvim/vimrc .vimrc
    $ ln -s ~/Projects/dotvim .vim
    $ ln -s ~/Projects/nvim-config .config/nvim

I install all my Vim plugins as git submodules. The `--recurse-submodules`
switch takes care of cloning them too.

[Neovim]: https://neovim.io
[Vim config]: https://github.com/gma/dotvim
