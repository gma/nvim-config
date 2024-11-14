return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    keys = {
      { "<leader>fT", ":Telescope builtin<cr>", noremap = true },

      { "<C-p>", ":Telescope git_files<cr>", noremap = true },
      { "<leader>ff", ":Telescope find_files<cr>", noremap = true },
      { "<leader><leader>", ":Telescope oldfiles<cr>", noremap = true },

      { "<leader>fG", ":Telescope grep_string<cr>", noremap = true },
      {
        "<leader>fp", function()
          local builtin = require("telescope.builtin")
          builtin.grep_string({ search = vim.fn.input("grep: ") })
        end,
        noremap = true,
        desc = "Telescope grep_string (prompt)",
      },
      { "<leader>fg", ":Telescope live_grep<cr>", noremap = true },

      { "<leader>b", ":Telescope buffers<cr>", noremap = true },

      { "<leader>fm", ":Telescope man_pages sections={'ALL'}<cr>", noremap = true },
      { "<leader>fh", ":Telescope help_tags<cr>", noremap = true },
      { "<leader>fC", ":Telescope commands<cr>", noremap = true },
      { "<leader>fk", ":Telescope keymaps<cr>", noremap = true },

      { "<leader>ft", ":Telescope tags<cr>", noremap = true },
      { "<leader>fd", ":Telescope diagnostics<cr>", noremap = true },
      { "<leader>fr", ":Telescope lsp_references<cr>", noremap = true },

      { "<leader>fc", ":Telescope git_commits<cr>", noremap = true },
      { "<leader>fb", ":Telescope git_bcommits<cr>", noremap = true },
      { "<leader>fl", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>", noremap = true },

      { "<leader>f<Up>", ":Telescope command_history<cr>", noremap = true },
      { "<leader>f/", ":Telescope search_history<cr>", noremap = true },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
            theme = "dropdown",
          },
          git_files = {
            theme = "dropdown",
          },
        },
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-u>"] = false,
              ["<C-b>"] = actions.preview_scrolling_up,
              ["<C-f>"] = actions.preview_scrolling_down,
            },
          },
        },
      })
    end,
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
