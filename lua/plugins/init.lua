return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "MasonUpdate",
        dependencies = {
          "williamboman/mason-lspconfig.nvim"
        }
      }
    }
  },
  "onsails/lspkind-nvim",

  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- The rest
  "L3MON4D3/LuaSnip",
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup({})
    end,
  },
  "folke/zen-mode.nvim",
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
}
