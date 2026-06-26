return {
  {
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "ansiblels",
          "bashls",
          "cssls",
          "dockerls",
          "eslint",
          "gopls",
          "html",
          "lua_ls",
          "pyright",
          "rust_analyzer",
          "ts_ls",
          "vimls",
          "yamlls",
        },
      },
      dependencies = {
        {
          "mason-org/mason.nvim",
          opts = {},
        },
        "neovim/nvim-lspconfig",
      },
    },
  },
}
