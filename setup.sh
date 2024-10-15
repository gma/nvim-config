#!/bin/sh

# This script will be run automatically by the devcontainer cli, when this
# repository is specified via the --dotfiles-repository switch.

# The script is run by a script that has set its CWD to the repository's root
# directory.

mkdir -p ~/.config && ln -sf "$PWD" ~/.config/nvim
