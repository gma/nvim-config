vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<tab>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
  },
  sources = cmp.config.sources({
    -- available options are:
    --   keyword_length
    --   priority               -- by default the order sets priority
    --   max_item_count

    { name = "nvim_lua" },      -- nvim_lua only applies in Lua files

    { name = "nvim_lsp" },
    { name = "path" },
    { name = 'luasnip' },
    { name = "buffer", keyword_length = 3 },
  }),
  experimental = {
    ghost_text = true,
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer', keyword_length = 5 }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline', keyword_length = 3 }
  })
})
