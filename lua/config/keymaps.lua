local set = vim.keymap.set

-- Navigation

set("n", "<C-h>", "<C-w>h", { desc = "Move to window to left" })
set("n", "<C-j>", "<C-w>j", { desc = "Move to window above" })
set("n", "<C-k>", "<C-w>k", { desc = "Move to window below" })
set("n", "<C-l>", "<C-w>l", { desc = "Move to window to right" })

set("n", "<C-d>", "<C-d>zz", { desc = "Scroll window down (centered)" })
set("n", "<C-u>", "<C-u>zz", { desc = "Scroll window up (centered)" })

set("n", "n", "nzzzv", { desc = "Next search match (centered)" })
set("n", "N", "Nzzzv", { desc = "Previous search match (centered)" })

set("n", "<leader>tm", "<cmd>silent !tmux new-window tm<cr>", { desc = "Run tm" })

-- Editing

set("n", "J", "mzJ`z", { desc = "Join lines" })

set("v", "K", ":move '<-2<cr>gv=gv", { desc = "Move selected lines up" })
set("v", "J", ":move '>+1<cr>gv=gv", { desc = "Move selected lines down" })

set("n", "<leader>S", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gci<Left><Left><Left><Left>", { desc = "Substitute word" })

-- For removing/replacing something without clobbering paste buffer
set("n", "<leader>d", "\"_d", { desc = "Delete to void register" })
set("v", "<leader>d", "\"_d", { desc = "Delete to void register" })
set("v", "<leader>p", "\"_dP", { desc = "Paste via void register" })

set("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
set("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
set("n", "<leader>Y", "\"+Y", { desc = "Yank lines to system clipboard" })

-- Display

vim.opt.listchars = { tab = '>-', trail = "·", eol = "$", extends = "#", nbsp = "·" }
set("n", "<leader>s", function()
  vim.o.list = not vim.o.list
end, { desc = "Show / hide whitespace", silent = true })

set("n", "<leader>ns", function()
  vim.o.spell = not vim.o.spell
end, { desc = "Toggle spellchecking", silent = true })

-- Other

set("n", "<leader>ex", "<cmd>!chmod +x %<cr>", { desc = "Make file executable" })

set("c", "%%", function()
  if vim.fn["getcmdtype"]() == ":" then
    return vim.fn["expand"]("%:h") .. "/"
  else
    return "%%"
  end
end, { expr = true, desc = "Sub %% for buffer's cwd" })
