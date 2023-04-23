vim.g.python3_host_prog = "/usr/bin/python3"

return {
  {
    "lepture/vim-jinja",
    ft = "html",
  },
  {
    "psf/black",
    cmd = "Black",
  },
  {
    "vim-scripts/indentpython.vim",
    ft = "python",
  },
}
