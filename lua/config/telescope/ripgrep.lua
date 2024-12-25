local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local M = {}

local live_ripgrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local ripgrep_job = finders.new_async_job({
    cwd = opts.cwd,

    entry_maker = make_entry.gen_from_vimgrep(opts),

    command_generator = function(input)
      if not input or input == "" then
        return nil
      end

      local parts = vim.split(input, "  ")
      local command = { "rg" }
      if parts[1] then
        table.insert(command, "-e")
        table.insert(command, parts[1])
      end
      if parts[2] then
        table.insert(command, "-g")
        table.insert(command, parts[2])
      end

      return vim.iter({
        command,
        {
          "--color=never",
          "--column",
          "--line-number",
          "--no-heading",
          "--smart-case",
          "--with-filename",
        }
      }):flatten():totable()
    end,
  })

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Live ripgrep (with -g after 󱁐 󱁐 )",
    finder = ripgrep_job,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end


M.setup = function()
  vim.keymap.set("n", "<leader>fg", live_ripgrep, { desc = "Run ripgrep" })
end

return M
