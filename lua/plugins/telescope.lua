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

local run_builtin_grep = function()
  local builtin = require("telescope.builtin")
  builtin.grep_string({ search = vim.fn.input("grep: ") })
end

local define_telescope_keymaps = function()
  vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fl", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>fT", ":Telescope builtin<cr>", { noremap = true })
  vim.keymap.set("n", "<C-p>", git_files_or_find_files, { noremap = true })
  vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { noremap = true })
  vim.keymap.set("n", "<leader><leader>", ":Telescope oldfiles only_cwd=true<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>fG", ":Telescope grep_string<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fp", run_builtin_grep, { noremap = true, desc = "Telescope grep_string (prompt)" })
  vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>fM", ":Telescope marks<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fR", ":Telescope registers<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>ft", ":Telescope tags<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>fc", ":Telescope git_commits<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fb", ":Telescope git_bcommits<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fB", ":Telescope git_branches<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>f<Up>", ":Telescope command_history<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>f/", ":Telescope search_history<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>fm", ":Telescope man_pages sections={'ALL'}<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fC", ":Telescope commands<cr>", { noremap = true })
  vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<cr>", { noremap = true })

  vim.keymap.set("n", "<leader>fn", function()
    require("telescope.builtin").find_files({ cwd = vim.fn.stdpath('config') })
  end, { noremap = true, desc = "Find file in Neovim config" })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = false,
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
            flip_columns = 130,
            prompt_position = "top",
            horizontal = {
              preview_width = 0.6,
              width = 0.9,
            },
            vertical = {
              preview_cutoff = 30,
              preview_height = 0.3,
            },
          },
        },
      })

      define_telescope_keymaps()
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
      {
        "<leader>B",
        ":Telescope file_browser sorting_strategy=ascending<cr>",
        desc = "Telescope file browser",
        noremap = true,
      },
    },
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
