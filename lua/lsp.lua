local capabilities = require('cmp_nvim_lsp').default_capabilities()

function lsp_keymaps()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", ":Ref<CR>", vim.lsp.buf.references, {buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {buffer=0})
end

require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

local function on_attach()
  lsp_keymaps()
end

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
    }
  }
}

for _, server in ipairs {
  "ansiblels",
  "bashls",
  "cssls",
  "dockerls",
  "eslint",
  "gopls",
  "html",
  "pyright",
  "rust_analyzer",
  "tsserver",
  "vimls",
  "yamlls"
} do
  lspconfig[server].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    on_attach = on_attach,
  }
end
