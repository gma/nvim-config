vim.g.black_linelength = 80

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("format_python", { clear = true }),
  callback = function(match)
    if vim.fn.filereadable(".use-blue") == 1 then
      vim.cmd.write()
      vim.fn.system("blue " .. match.file)
      vim.cmd.edit({ bang = true })
    elseif vim.fn.filereadable(".use-black") == 1 then
      vim.fn.execute(":Black")
    end
  end,
})
