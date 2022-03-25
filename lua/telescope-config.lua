require"telescope".setup{}

require"telescope".load_extension("file_browser")
require"telescope".load_extension("fzf")

vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser<cr>", { noremap = true })
