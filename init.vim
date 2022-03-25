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

" Execute current line (or highlighted block) of code with <leader>x
function! s:executor() abort
  if &ft == 'lua'
    call execute(printf(":lua %s", getline(".")))
  elseif &ft == 'vim'
    exe getline(".")
  endif
endfunction
nnoremap <leader>x :call <SID>executor()<CR>
vnoremap <leader>x :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>
