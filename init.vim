set runtimepath^=~/.vim,~/.vim/after
set packpath^=~/.vim
source ~/.vim/vimrc

source ~/.config/nvim/packages.vim

lua require("telescope-config")
lua require("completion")
lua require("lsp")

" Neovim-specific options
highlight WinSeparator guifg=#444444 guibg=None   " window border colour

set laststatus=2          " enable global statusline
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

" Use system python (where pynvim module is installed)
let g:python3_host_prog = "/usr/bin/python3"

" Configure Neoformat
let g:neoformat_try_node_exe = 1
autocmd BufWritePre *.css,*.js,*.ts,*.tsx Neoformat
