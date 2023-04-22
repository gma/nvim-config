require"telescope".setup{}

require"telescope".load_extension("file_browser")
require"telescope".load_extension("fzf")

vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>B", ":Telescope file_browser sorting_strategy=ascending<CR><CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fC", ":Telescope commands<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fm", ":Telescope keymaps<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>ft", ":Telescope tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fd", ":Telescope diagnostics<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>fc", ":Telescope git_commits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope git_bcommits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fl", ":Telescope current_buffer_fuzzy_find sorting_strategy=ascending<CR>", { noremap = true })
