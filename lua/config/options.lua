-- Vim compatible settings
--
-- This block of settings are compatible with Vim 8.

vim.opt.tabstop = 2               -- default size of a real tab stop
vim.opt.softtabstop = 2           -- pressing tab/backspaces inserts/removes 2 chars
vim.opt.shiftwidth = 2            -- the number of spaces used by << and >>
vim.opt.shiftround = true         -- round spaces indented by <, > to multiple of width
vim.opt.expandtab = true          -- insert spaces instead of tabs
vim.opt.copyindent = true         -- if this line uses tabs, use them on next line
vim.opt.preserveindent = true     -- don't replace existing tabs to spaces on re-indent

vim.opt.number = true             -- display current line number in gutter
vim.opt.relativenumber = true     -- show distance instead of other lines' numbers

vim.opt.autoindent = true
vim.opt.wrap = false              -- disable line wrapping
-- opt.hlsearch = true           -- highlight search matches
vim.opt.incsearch = true          -- incremental search
vim.opt.inccommand = "split"      -- preview :s/a/b/ substitution in split
vim.opt.ignorecase = true         -- case insensitive search...
vim.opt.smartcase = true          -- ...unless you use a capital in your search

vim.opt.matchtime = 2             -- time to highlight matching parentheses (x 0.1s)
vim.opt.scrolloff = 5             -- scroll buffer when cursor approaches top/bottom

vim.opt.hidden = true             -- open multiple files in one 'window'
vim.opt.autoread = true           -- re-read files if they're changed on disk
vim.opt.laststatus = 2            -- always show status bar
vim.opt.ruler = true              -- display the ruler at the bottom of the window

vim.opt.history = 1000            -- remember more than 20 commands/search patterns
vim.opt.swapfile = false
vim.opt.backup = false            -- don't create file called foo~ when editing foo

vim.opt.splitbelow = true         -- open new split below, and
vim.opt.splitright = true         -- to the right of the current pane

vim.opt.dictionary:append("/usr/share/dict/words")  -- useful for <C-x> <C-k> completion

vim.opt.path = { ".", "", "**" }  -- enable :find to search beneath cwd
vim.opt.wildmenu = true           -- nice tab completion just above the status bar
vim.opt.wildmode = "full:lastused"
vim.opt.wildignore = "tmp/cache/**"
vim.opt.wildoptions = "pum,tagfile"

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.opt.undofile = true           -- save buffer-specific undo history in ~/.local
vim.opt.updatetime = 1000         -- milliseconds between writing to swap file

vim.g.netrw_banner = 0

-- Neovim specific settings
--
-- The settings higher up in this file were brought over from my Vim 8
-- config. The following are only supported by Neovim.

vim.opt.laststatus = 2            -- enable global statusline
vim.opt.signcolumn = "yes"        -- show space where signs appear in the gutter
vim.opt.termguicolors = true      -- enable 24-bit colour

vim.opt.complete = { ".", "w", "b", "u", "t" }
vim.opt.completeopt = { "fuzzy", "menu", "menuone", "popup" }
