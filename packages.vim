function! PackInit() abort
  packadd minpac

  call minpac#init({'dir': '/home/graham/.config/nvim'})

  " Plugins loaded at start
  call minpac#add('L3MON4D3/LuaSnip')
  call minpac#add('hrsh7th/cmp-buffer', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-cmdline', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-nvim-lsp', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-nvim-lua', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-path', {'rev': 'main'})
  call minpac#add('hrsh7th/nvim-cmp', {'rev': 'main'})
  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('nvim-lua/plenary.nvim')
  call minpac#add('nvim-telescope/telescope-fzf-native.nvim', {'rev': 'main', 'do': 'make'})
  call minpac#add('nvim-telescope/telescope.nvim')
  call minpac#add('onsails/lspkind-nvim')

  " Optional plugins, load them with `:packadd <name>`
endfunction

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" Telescope
lua require("telescope-config")

nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope git_files<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>
nnoremap <leader>fc :Telescope git_commits<CR>
nnoremap <leader>fC :Telescope git_bcommits<CR>
nnoremap <leader>ft :Telescope tags<CR>
nnoremap <leader>fm :Telescope keymaps<CR>
