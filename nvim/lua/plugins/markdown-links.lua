return {
  'jghauser/follow-md-links.nvim',
  config = function()
    vim.keymap.set('n', '<bs>', ':edit #<CR>', { silent = true })
  end
}
