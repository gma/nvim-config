function! PackInit() abort
  packadd minpac

  call minpac#init({'dir': '/home/graham/.config/nvim'})

  " Plugins loaded at start
  call minpac#add('L3MON4D3/LuaSnip')
  call minpac#add('hrsh7th/cmp-nvim-lsp', {'rev': 'main'})
  call minpac#add('hrsh7th/nvim-cmp', {'rev': 'main'})
  call minpac#add('neovim/nvim-lspconfig')

  " Optional plugins, load them with `:packadd <name>`
endfunction

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
