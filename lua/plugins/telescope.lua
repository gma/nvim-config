local is_inside_work_tree = {}

local git_files_or_find_files = function()
  local builtin = require("telescope.builtin")
  local opts = {} -- define here if you want to define something

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

local define_telescope_keymaps = function()
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>b", builtin.buffers, {
    noremap = true,
    desc = "Find buffer"
  })
  vim.keymap.set("n", "<leader>fl", function()
    builtin.current_buffer_fuzzy_find({ sorting_strategy = "ascending" })
  end, {
    noremap = true,
    desc = "Find line in buffer"
  })
  vim.keymap.set("n", "<leader>fT", builtin.builtin, {
    noremap = true,
    desc = "Find Telescope builtins"
  })
  vim.keymap.set("n", "<C-p>", git_files_or_find_files, {
    noremap = true,
    desc = "Find file"
  })
  vim.keymap.set("n", "<leader>ff", builtin.find_files, {
    noremap = true,
    desc = "Find file (no git)"
  })
  vim.keymap.set("n", "<leader><leader>", function()
    builtin.oldfiles({ only_cwd = true })
  end, {
    noremap = true,
    desc = "Recent files"
  })

  vim.keymap.set("n", "<leader>fG", builtin.grep_string, {
    noremap = true,
    desc = "Telescope grep (word)"
  })
  vim.keymap.set("n", "<leader>fp", function()
    builtin.grep_string({ search = vim.fn.input("grep: ") })
  end, {
    noremap = true,
    desc = "Telescope grep (prompt)"
  })

  vim.keymap.set("n", "<leader>fM", builtin.marks, {
    noremap = true,
    desc = "Search marks"
  })
  vim.keymap.set("n", "<leader>fR", builtin.registers, {
    noremap = true,
    desc = "Search registers"
  })

  vim.keymap.set("n", "<leader>ft", builtin.tags, {
    noremap = true,
    desc = "Find tags"
  })
  vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {
    noremap = true,
    desc = "Find LSP references"
  })

  vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {
    noremap = true,
    desc = "Search diagnostics"
  })

  vim.keymap.set("n", "<leader>fc", builtin.git_commits, {
    noremap = true,
    desc = "Search commits"
  })
  vim.keymap.set("n", "<leader>fb", builtin.git_bcommits, {
    noremap = true,
    desc = "Search buffer's commits"
  })
  vim.keymap.set("n", "<leader>fB", builtin.git_branches, {
    noremap = true,
    desc = "Browse branches"
  })

  vim.keymap.set("n", "<leader>f<Up>", builtin.command_history, {
    noremap = true,
    desc = "Command history"
  })
  vim.keymap.set("n", "<leader>f/", builtin.search_history, {
    noremap = true,
    desc = "Search history"
  })

  vim.keymap.set("n", "<leader>fm", function()
    builtin.man_pages({ sections = { "ALL" } })
  end, {
    noremap = true,
    desc = "Find man page"
  })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
    noremap = true,
    desc = "Search help tags"
  })
  vim.keymap.set("n", "<leader>fC", builtin.commands, {
    noremap = true,
    desc = "Search Vim commands"
  })
  vim.keymap.set("n", "<leader>fk", builtin.keymaps, {
    noremap = true,
    desc = "Search keymaps"
  })

  vim.keymap.set("n", "<leader>fvc", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end, { noremap = true, desc = "Find file in vim config" })
  vim.keymap.set("n", "<leader>fvp", function()
    builtin.find_files({
      cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
    })
  end, { noremap = true, desc = "Find file in vim plugin" })
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
      require("config.telescope.ripgrep").setup()
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
