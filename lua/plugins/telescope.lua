local is_inside_work_tree = {}

local git_files_or_find_files = function()
  local opts = {} -- define here if you want to define something

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    require("telescope.builtin").git_files(opts)
  else
    require("telescope.builtin").find_files(opts)
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    keys = {
      { "<leader>fT", ":Telescope builtin<cr>", noremap = true },

      { "<C-p>", git_files_or_find_files, noremap = true },
      { "<leader>ff", ":Telescope find_files<cr>", noremap = true },
      { "<leader><leader>", ":Telescope oldfiles only_cwd=true<cr>", noremap = true },

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
          layout_strategy = "flex",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
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
