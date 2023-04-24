local function augroup(name)
  return vim.api.nvim_create_augroup("gma_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = augroup("suckless"),
  pattern = "*/suckless/*/config.h",
  callback = function()
    vim.fn.system("make && sudo make install")
  end
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  command = "tabdo wincmd =",
})
