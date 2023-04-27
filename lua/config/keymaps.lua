local set = vim.keymap.set

set("n", "<C-h>", "<C-w>h", { desc = "Move to window to left" })
set("n", "<C-j>", "<C-w>j", { desc = "Move to window above" })
set("n", "<C-k>", "<C-w>k", { desc = "Move to window below" })
set("n", "<C-l>", "<C-w>l", { desc = "Move to window to right" })

vim.opt.listchars = { tab = '>-', trail = "·", eol = "$", extends = "#", nbsp = "·" }
set("n", "<leader>s", function()
  vim.o.list = not vim.o.list
end, { desc = "Show / hide whitespace", silent = true })

set("c", "%%", function()
  if vim.fn["getcmdtype"]() == ":" then
    return vim.fn["expand"]("%:h") .. "/"
  else
    return "%%"
  end
end, { expr = true, desc = "Sub %% for buffer's cwd" })
