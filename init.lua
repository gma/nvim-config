vim.g.mapleader = " "

require("setup-lazy-nvim")
require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

require("config")
