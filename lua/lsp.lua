local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

function default_lsp_keymaps()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "ctrl-]", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", ":Ref<CR>", vim.lsp.buf.references, {buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {buffer=0})
end

require'lspconfig'.gopls.setup{
  capabilities = capabilities,
  on_attach = function()
    default_lsp_keymaps()
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  end,
}

require'lspconfig'.pyright.setup{
  capabilities = capabilities,
  on_attach = function()
    default_lsp_keymaps()
  end,
}
