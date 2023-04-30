return {
  {
    "mustache/vim-mustache-handlebars",
    ft = "html.mustache",
  },
  {
    "MaxMEllon/vim-jsx-pretty",
    ft = { "javascript.jsx", "typescriptreact" },
  },
  {
    "pangloss/vim-javascript",
    ft = { "javascript.jsx", "typescriptreact" },
  },
  {
    "pantharshit00/vim-prisma",
    ft = "prisma",
  },
  {
    "posva/vim-vue",
    ft = "vue",
  },

  -- TypeScript
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({})
    end,
  },
}
