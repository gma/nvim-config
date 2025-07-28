vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("gma_neoformat", { clear = true }),
  pattern = {"*.css", "*.js", "*.ts", "*.tsx"},
  command = "Neoformat"
})

return {
  "duane9/nvim-rg",
  {
    "preservim/vimux",
    lazy = false,
    keys = {
      { "<leader>vp", ":VimuxPromptCommand<cr>", desc = "Run command in tmux pane" },
      { "<leader>vl", ":VimuxRunLastCommand<cr>", desc = "Re-run last command" },
    },
    config = function()
      vim.g["test#strategy"] = "vimux"
      vim.g["test#echo_command"] = 0
      vim.g["test#preserve_screen"] = 1
    end
  },
  {
    "itspriddle/vim-shellcheck",
    ft = "sh",
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "[h", ":Gitsigns prev_hunk<CR>", desc = "Go to previous hunk" },
      { "]h", ":Gitsigns next_hunk<CR>", desc = "Go to next hunk" },
      { "<leader>gp", ":Gitsigns preview_hunk<CR>:Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
      { "<leader>gb", ":Gitsigns blame_line<CR>", desc = "Show blame for line" },
    },
    lazy = false,
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "sbdchd/neoformat",
    cmd = "Neoformat",
    config = function()
      vim.g.neoformat_try_node_exe = 1
    end,
  },
  "tpope/vim-commentary",
  {
    "tpope/vim-fugitive",
    config = function()
      vim.opt.tags:prepend("./.git/tags;")
    end,
    lazy = false,
    keys = {
      { "<leader>gs", ":tab Git<cr>", desc = "Run fugitive (in tab)" },
      { "<leader>gS", ":vert Git<cr>", desc = "Run fugitive (to side)" },
      { "<leader>gl", ":tab Git log ", desc = "Git log" },
      { "<leader>gf", ":diffget //2<cr>", desc = "Accept left hunk" },
      { "<leader>gj", ":diffget //3<cr>", desc = "Accept right hunk" },
    },
  },
  "RRethy/nvim-treesitter-endwise",
  "tpope/vim-git",
  "tpope/vim-projectionist",
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tl", ":TestNearest<CR>", desc = "Run nearest test" },
      { "<leader>tf", ":TestFile<CR>", desc = "Run file" },
      { "<leader>ta", ":TestSuite<CR>", desc = "Run full suite" },
      { "<leader>tt", ":TestNearest<CR>", desc = "Re-run last" },
      { "<leader>to", ":TestVisit<CR>", desc = "Navigate back to last test" },
    },
  },
}
