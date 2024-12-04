vim.keymap.set("n", "<leader>xx", ":source %<cr>", { desc = "Source file" })
vim.keymap.set("n", "<leader>xl", ":.lua<cr>", { desc = "Run :.lua" })
vim.keymap.set("v", "<leader>xl", ":lua<cr>", { desc = "Run :lua" })
