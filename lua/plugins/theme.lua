return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("kanagawa-wave")
    -- end
  }
}
