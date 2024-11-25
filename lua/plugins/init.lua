return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup({
        icons = {
          mappings = false,
        },
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 86,
        },
      })
    end,
    keys = {
      { "<leader>o", ":ZenMode<cr>", desc = "Toggle Zen mode" },
    },
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
}
