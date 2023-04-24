return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    keys = {
      { "<C-p>", ":Telescope git_files<cr>", noremap = true },
      { "<leader>ff", ":Telescope find_files<cr>", noremap = true },
      { "<leader>fg", ":Telescope live_grep<cr>", noremap = true },

      { "<leader>b", ":Telescope buffers<cr>", noremap = true },

      { "<leader>fh", ":Telescope help_tags<cr>", noremap = true },
      { "<leader>fC", ":Telescope commands<cr>", noremap = true },
      { "<leader>fm", ":Telescope keymaps<cr>", noremap = true },

      { "<leader>ft", ":Telescope tags<cr>", noremap = true },
      { "<leader>fd", ":Telescope diagnostics<cr>", noremap = true },

      { "<leader>fc", ":Telescope git_commits<cr>", noremap = true },
      { "<leader>fb", ":Telescope git_bcommits<cr>", noremap = true },
      { "<leader>fl", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>", noremap = true },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      { "<leader>B", ":Telescope file_browser sorting_strategy=ascending<cr>", noremap = true },
    },
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
