local function setup_lsp()
  local lsp = require("lsp-zero").preset({
    manage_nvim_cmp = {
      set_source = "recommended",
      set_extra_mappings = true,
    }
  })

  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
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
    "rust_analyzer",
    "tsserver",
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
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
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
    "hrsh7th/cmp-path",

    "L3MON4D3/LuaSnip",
  },
}
