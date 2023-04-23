vim.opt.runtimepath:prepend({"~/.vim","~/.vim/after"})
vim.opt.packpath:prepend("~/.vim")
vim.cmd.source "~/.vim/vimrc"

require("setup-lazy-nvim")
require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

vim.cmd "highlight WinSeparator guifg=#444444 guibg=None"

require("config")

vim.o.laststatus = 2          -- enable global statusline
vim.o.signcolumn = "yes"      -- show space where signs appear in the gutter
vim.o.termguicolors = true    -- enable 24-bit colour

-- Use system python (where pynvim module is installed)
vim.g.python3_host_prog = "/usr/bin/python3"

-- Configure Neoformat
vim.g.neoformat_try_node_exe = 1
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.css", "*.js", "*.ts", "*.tsx"},
  command = "Neoformat"
})
