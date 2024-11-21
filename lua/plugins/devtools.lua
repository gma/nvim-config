vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("gma_neoformat", { clear = true }),
  pattern = {"*.css", "*.js", "*.ts", "*.tsx"},
  command = "Neoformat"
})

return {
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>tn", ":TestNearest<CR>", desc = "Run nearest test" },
      { "<leader>tf", ":TestFile<CR>", desc = "Run file" },
      { "<leader>ta", ":TestSuite<CR>", desc = "Run full suite" },
      { "<leader>tl", ":TestNearest<CR>", desc = "Re-run last" },
      { "<leader>to", ":TestVisit<CR>", desc = "Navigate back to last test" },
    },
  },
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
  "duane9/nvim-rg",
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
    cmd = { "G", "Git", "Gread", "Gwrite", "GDelete", "GMove", "GRemove" },
    keys = {
      { "<leader>gs", ":Git<cr>", desc = "Run fugitive" },
      { "<leader>gl", ":Git log ", desc = "Git log" },
      { "<leader>gf", ":diffget //2<cr>", desc = "Accept left hunk" },
      { "<leader>gj", ":diffget //3<cr>", desc = "Accept right hunk" },
    },
  },
  "tpope/vim-git",
  "tpope/vim-projectionist",
}
