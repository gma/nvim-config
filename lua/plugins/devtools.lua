vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("gma_neoformat", { clear = true }),
  pattern = {"*.css", "*.js", "*.ts", "*.tsx"},
  command = "Neoformat"
})

return {
  {
    "benmills/vimux",
    keys = {
      { "<leader>vp", ":VimuxPromptCommand<cr>", desc = "Run command with vimux" },
      { "<leader>vl", ":VimuxRunLastCommand<cr>", desc = "Repeat last vimux command" },
    }
  },
  {
    "itspriddle/vim-shellcheck",
    ft = "sh",
  },
  "jremmen/vim-ripgrep",
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
