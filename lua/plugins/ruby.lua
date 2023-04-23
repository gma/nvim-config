return {
  {
    "nelstrom/vim-textobj-rubyblock",
    dependencies = {
      "kana/vim-textobj-user",
    }
  },
  {
    "tpope/vim-bundler",
    ft = { "ruby", "gemfilelock" },
  },
  {
    "tpope/vim-rails",
    ft = { "ruby" },
    config = function()
      -- Load Rails logs' deprecation warnings into the quickfix window
      -- by running `nvim -q log`, then jump to the source of each error
      vim.opt.errorformat:append('DEPRECATION WARNING: %m (called %.%+ %f:%l)')
    end
  },
  {
    "tpope/vim-rake",
    ft = { "ruby" },
  },
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby" },
  },
}
