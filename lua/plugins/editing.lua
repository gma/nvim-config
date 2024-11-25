return {
  {
    "gabrielelana/vim-markdown",
    ft = "markdown",
    keys = {
      { "<leader>h1", "yypVr=", mode = "n", desc = "Convert to h1" },
      { "<leader>h2", "yypVr-", mode = "n", desc = "Convert to h2" },
      { "<leader>h3", "I### <esc>0", mode = "n", desc = "Convert to h3" },
    },
    config = function()
      vim.g.markdown_enable_spell_checking = 0
    end,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", ":UndotreeToggle<CR>", mode = "n", desc = "Toggle Undotree" },
    },
  },
  "michaeljsmith/vim-indent-object",
  "tpope/vim-endwise",
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
}
