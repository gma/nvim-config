local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function lsp_keymaps()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", ":Ref<CR>", vim.lsp.buf.references, {buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {buffer=0})
end

require("mason").setup()
require("mason-lspconfig").setup {
  automatic_installation = true
}
local lspconfig = require("lspconfig")

local default_options = {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = lsp_keymaps,
}

local server_settings = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
      },
    },
  },
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  },
}

for _, server in ipairs {
  "ansiblels",
  "bashls",
  "cssls",
  "dockerls",
  "eslint",
  "gopls",
  "html",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "tsserver",
  "vimls",
  "yamlls",
} do
  local options = {}
  for k, v in pairs(default_options) do options[k] = v end
  for k, v in pairs(server_settings[server] or {}) do options[k] = v end
  lspconfig[server].setup(options)
end
