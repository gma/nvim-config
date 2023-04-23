function! PackInit() abort
  packadd minpac

  call minpac#init({'dir': '/home/graham/.config/nvim'})

  " Plugins loaded at start
  call minpac#add('L3MON4D3/LuaSnip')
  call minpac#add('folke/zen-mode.nvim', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-buffer', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-cmdline', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-nvim-lsp', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-nvim-lua', {'rev': 'main'})
  call minpac#add('hrsh7th/cmp-path', {'rev': 'main'})
  call minpac#add('hrsh7th/nvim-cmp', {'rev': 'main'})
  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('nvim-lua/plenary.nvim')
  call minpac#add('nvim-telescope/telescope-file-browser.nvim')
  call minpac#add('nvim-telescope/telescope-fzf-native.nvim', {'rev': 'main', 'do': 'make'})
  call minpac#add('nvim-telescope/telescope.nvim', {'rev': '0.1.x'})
  call minpac#add('onsails/lspkind-nvim')
  call minpac#add('sbdchd/neoformat')
  call minpac#add('williamboman/mason.nvim', {'rev': 'main', 'do': 'MasonUpdate'})
  call minpac#add('williamboman/mason-lspconfig.nvim', {'rev': 'main'})

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
