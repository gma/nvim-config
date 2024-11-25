Neovim Config
=============

This repository contains my configuration files for the [Neovim] text editor.

It includes:

- The lazy.nvim plugin manager (easy to use, but also very flexible)
- Telescope (a great interface to browsing things like files, commits, man
  pages, with a fuzzy finder interface)
- Support for language servers (LSP) via nvim-lsp and nvim-cmp based
  completion, configured through lsp-zero.nvim
- Treesitter support for more nuanced syntax highlighting (you'll want to
  install the `tree-sitter` command line program as well, which will then
  take care of installing new parsers for you automatically)
- The fugitive plugin for Git
- Some useful editing setup (e.g. Tim Pope's unimpaired and surround
  plugins, and a handful of ThePrimeagen's keymaps)
- The excellent which-key plugin to remind you what all the useful keymaps are
- A handful of autocommands that make daily life that little bit smoother

If you find yourself wondering how something works, check the message of the
commit that added it (e.g. with `git log -S`). I like to leave "future me"
notes on why things are the way they are, so my commit history often contains
links to blog posts, explainer videos, etc.

Setup
-----

To get it running, I essentially do this:

    $ mkdir ~/Code
    $ git clone https://github.com/gma/nvim-config.git Code/nvim-config
    $ ln -s ~/Code/nvim-config .config/nvim

To install the `tree-sitter` command line program you can either install it
from Cargo (if you have Rust configured):

    $ cargo install tree-sitter-cli

…or from NPM if you prefer Node:

    $ npm install -g tree-sitter-cli

[Neovim]: https://neovim.io
[Vim 8 repository]: https://github.com/gma/dotvim

Usage tips
----------

Plugins are installed with [lazy.nvim], which comes with a UI for reviewing and
installing plugin updates. To use it, type:

    :Lazy

You'll then be able to check for updates with `C`, install and sync changes
with `S`, etc. Use `?` to show/hide the quick help, `:help lazy.nvim` for the
full details.

Language servers are installed and configured with [Mason] (the project formerly
known as nvim-lsp-installer). It too has a nice UI for managing installed
servers:

    :Mason

It can also install formatting tools. See `:help mason.nvim`.

[lazy.nvim]: https://github.com/folke/lazy.nvim
[Mason]: https://github.com/williamboman/mason.nvim
