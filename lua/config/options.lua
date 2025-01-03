local opt = vim.opt

-- Vim compatible settings
--
-- This block of settings are compatible with Vim 8.

opt.tabstop = 2               -- default size of a real tab stop
opt.softtabstop = 2           -- pressing tab/backspaces inserts/removes 2 chars
opt.shiftwidth = 2            -- the number of spaces used by << and >>
opt.shiftround = true         -- round spaces indented by <, > to multiple of width
opt.expandtab = true          -- insert spaces instead of tabs
opt.copyindent = true         -- if this line uses tabs, use them on next line
opt.preserveindent = true     -- don't replace existing tabs to spaces on re-indent

opt.number = true             -- display current line number in gutter
opt.relativenumber = true     -- show distance instead of other lines' numbers

opt.autoindent = true
opt.wrap = false              -- disable line wrapping
-- opt.hlsearch = true           -- highlight search matches
opt.incsearch = true          -- incremental search
opt.ignorecase = true         -- case insensitive search...
opt.smartcase = true          -- ...unless you use a capital in your search

opt.matchtime = 2             -- time to highlight matching parentheses (x 0.1s)
opt.scrolloff = 5             -- scroll buffer when cursor approaches top/bottom

opt.hidden = true             -- open multiple files in one 'window'
opt.autoread = true           -- re-read files if they're changed on disk
opt.laststatus = 2            -- always show status bar
opt.ruler = true              -- display the ruler at the bottom of the window

opt.history = 1000            -- remember more than 20 commands/search patterns
opt.swapfile = false
opt.backup = false            -- don't create file called foo~ when editing foo

opt.splitbelow = true         -- open new split below, and
opt.splitright = true         -- to the right of the current pane

opt.dictionary:append("/usr/share/dict/words")  -- useful for <C-x> <C-k> completion

opt.path = { ".", "", "**" }  -- enable :find to search beneath cwd
opt.wildmenu = true           -- nice tab completion just above the status bar
opt.wildmode = { list = "full" } -- tab completes common prefix, but lists choices
opt.wildignore = "tmp/cache/**"

opt.colorcolumn = "80"
opt.cursorline = true

opt.undofile = true           -- save buffer-specific undo history in ~/.local
opt.updatetime = 1000         -- milliseconds between writing to swap file

vim.g.netrw_banner = 0

-- Neovim specific settings
--
-- The settings higher up in this file were brought over from my Vim 8
-- config. The following are only supported by Neovim.

opt.laststatus = 2            -- enable global statusline
opt.signcolumn = "yes"        -- show space where signs appear in the gutter
opt.termguicolors = true      -- enable 24-bit colour
