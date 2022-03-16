set runtimepath^=~/.vim,~/.vim/after
set packpath^=~/.vim
source ~/.vim/vimrc

source ~/.config/nvim/packages.vim

lua require("lsp")

" Neovim-specific options
set signcolumn=yes        " show space where signs appear in the gutter
