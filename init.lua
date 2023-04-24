vim.g.mapleader = ","

require("setup-lazy-nvim")
require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

require("config")

vim.o.laststatus = 2          -- enable global statusline
vim.o.signcolumn = "yes"      -- show space where signs appear in the gutter
vim.o.termguicolors = true    -- enable 24-bit colour
