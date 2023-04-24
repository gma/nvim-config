return {
  {
    "benmills/vimux",
    keys = {
      { "<leader>vp", ":VimuxPromptCommand<cr>", desc = "Run command with vimux" },
      { "<leader>vl", ":VimuxRunLastCommand<cr>", desc = "Repeat last vimux command" },
      { "<leader>vi", ":VimuxInspectRunner<cr>", desc = "Inspect vimux runner" },
      { "<leader>vq", ":VimuxCloseRunner<cr>", desc = "Close vimux runner" },
      { "<leader>vc", ":VimuxClearRunnerHistory<cr>", desc = "Clear vimux runner history" },
    }
  },
  {
    "itspriddle/vim-shellcheck",
    ft = "sh",
  },
  "jremmen/vim-ripgrep",
  "mattn/emmet-vim",
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
    keys = {
      { "<leader>gs", ":Git<cr>", desc = "Run fugitive" },
      { "<leader>gf", ":diffget //2<cr>", desc = "Accept left hunk" },
      { "<leader>gj", ":diffget //3<cr>", desc = "Accept right hunk" },
    },
  },
  "tpope/vim-git",
  "tpope/vim-projectionist",
}
