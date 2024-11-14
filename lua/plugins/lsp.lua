local function setup_lsp()
  local lsp = require("lsp-zero").preset({
    manage_nvim_cmp = {
      set_source = "recommended",
      set_extra_mappings = true,
    }
  })

  local function map(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { desc = desc, buffer = true })
  end

  lsp.on_attach(function(client, bufnr)
    map("<leader>l", ":LspStop<CR>", "Stop LSP client")
    map("<leader>L", ":LspStart<CR>", "Start LSP client")

    map("K", vim.lsp.buf.hover, "Show info in window")
    map("gd", vim.lsp.buf.definition, "Jump to definition")
    map("gD", vim.lsp.buf.declaration, "Jump to declaration")
    map("gi", vim.lsp.buf.implementation, "List implementations in quickfix")
    map("go", vim.lsp.buf.type_definition, "Jump to definition of type")
    map("gr", vim.lsp.buf.references, "List references in quickfix")
    map("gh", vim.lsp.buf.signature_help, "Show signature info in window")
    map("<F2>", vim.lsp.buf.rename, "Rename symbol")
    map("<F3>", vim.lsp.buf.format, "Format buffer")
    map("<F4>", vim.lsp.buf.code_action, "Select code action")
    map("gl", vim.diagnostic.open_float, "Show diagnostic in window")
    map("[d", vim.diagnostic.goto_prev, "Move to previous diagnostic")
    map("]d", vim.diagnostic.goto_next, "Move to next diagnostic")

    -- My preferred alternatives to some defaults
    map("<leader>r", vim.lsp.buf.rename, "Rename symbol")
    map("g=", vim.lsp.buf.format, "Format buffer")
    map("ca", vim.lsp.buf.code_action, "Select code action")
  end)

  lsp.setup_servers({
    "ansiblels",
    "bashls",
    "cssls",
    "dockerls",
    "eslint",
    "gopls",
    "html",
    "pyright",
    "ruby_lsp",
    "rust_analyzer",
    "vimls",
    "yamlls",
  })

  -- nvim_lua_ls() returns Neovim-specific settings for lua_ls
  require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

  lsp.setup()
end

local function setup_completion()
  local cmp = require("cmp")

  cmp.setup({
    sources = {
      { name = "path" },
      { name = "nvim_lsp" },
      { name = "buffer", keyword_length = 4 },
      { name = "luasnip", keyword_length = 2 },
      { name = "nvim_lua" },
    },
    preselect = "item",
    mapping = {
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    },
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "buffer" } }),
    view = {
      entries = {
        name = "wildmenu",
      },
    },
  })
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path", },
    },
    {
      { name = "cmdline", keyword_length = 3, },
    }),
    view = {
      entries = {
        name = "wildmenu",
      },
    },
  })
end

return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  config = function()
    setup_lsp()
    setup_completion()
  end,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
        cmd = "MasonUpdate",
      },
      { "williamboman/mason-lspconfig.nvim" },
    },

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",

    "L3MON4D3/LuaSnip",
  },
}
