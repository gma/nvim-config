local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

function lsp_keymaps()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "ctrl-]", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", ":Ref<CR>", vim.lsp.buf.references, {buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {buffer=0})
end

local lsp_installer = require'nvim-lsp-installer'
lsp_installer.on_server_ready(function(server)
  local options = {
    capabilities = capabilities,
    on_attach = function()
      lsp_keymaps()
    end,
    flags = {
      debounce_text_changes = 150,
    },
  }

  if server.name == 'sumneko_lua' then
    options.settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } }
      }
    }
  end

  server:setup(options)
end)
