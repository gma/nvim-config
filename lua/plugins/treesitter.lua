return {
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {}, -- tree-sitter CLI must be installed system-wide
    config = function()
      require("tree-sitter-manager").setup({
        auto_install = true,
        -- Use built-in Neovim treesitter parsers
        noauto_install = {
          "c",
          "lua",
          "markdown",
          "markdown_inline",
          "query",
          "vim",
          "vimdoc",
        },
        ensure_installed = {
          "bash",
          "css",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "html",
          "javascript",
          "python",
          "query",
          "ruby",
          "rust",
          "typescript",
          "yaml",
        }
      })
    end,
  }
}
