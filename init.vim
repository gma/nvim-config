set runtimepath^=~/.vim,~/.vim/after
set packpath^=~/.vim
source ~/.vim/vimrc

source ~/.config/nvim/packages.vim

lua require("completion")
lua require("lsp")

" Neovim-specific options
highlight WinSeparator guifg=#444444 guibg=None   " window border colour

set laststatus=3          " enable global statusline
set signcolumn=yes        " show space where signs appear in the gutter
set termguicolors         " enable 24-bit colour
