local function colorscheme_theme()
  local config = vim.fn.expand("~/.config/base16-theme")
  return "base16-" .. vim.fn.readfile(config)[1]
end

local function airline_theme()
  return table.concat(vim.split(colorscheme_theme(), "-"), "_")
end

return {
  {
    "fnune/base16-vim",
    config = function()
      vim.g.base16_colorspace = 256
      vim.cmd.colorscheme(colorscheme_theme())
      vim.cmd.highlight("WinSeparator guifg=#444444 guibg=None")
    end,
  },
  {
    "vim-airline/vim-airline-themes",
    config = function()
      vim.g.airline_theme = airline_theme()
    end,
    dependencies = {
      "vim-airline/vim-airline",
    },
  },
}
