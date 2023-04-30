local function augroup(name)
  return vim.api.nvim_create_augroup("gma_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  group = augroup("checktime"),
  command = "checktime",
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("neoformat"),
  pattern = {"*.css", "*.js", "*.ts", "*.tsx"},
  command = "Neoformat"
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = augroup("suckless"),
  pattern = "*/suckless/*/config.h",
  callback = function()
    vim.fn.system("make && sudo make install")
  end
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = augroup("highlight_yank"),
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  command = "tabdo wincmd =",
})
