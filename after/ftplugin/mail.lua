vim.opt_local.joinspaces = false  -- don't insert two spaces after "."
vim.opt_local.linebreak = true    -- wrap on word boundaries
vim.opt_local.smartindent = false
vim.opt_local.textwidth = 0
vim.opt_local.wrap = true         -- soft wrap (as textwidth is 0)

local reformat_richards_email = function()
  vim.cmd(':mark m')                -- store cursor position in mark "m"
  vim.cmd(':%s/^>   /> /')          -- outdent overly-indented quoted text
  vim.cmd(':%s/\\.$/.\r/')          -- unwrap hard-wrapped paragraphs
  vim.cmd("'m")                     -- return to mark "m"
  -- vim.cmd('norm 2j')
  -- vim.cmd('norm j<C-v>/^$<cr>klxkV}k:join')  -- unwrap space-delimited block
  vim.cmd(':set nohlsearch')
end

vim.keymap.set('n', '<leader>rt', reformat_richards_email, { desc = "Reformat RHT's emails" })
