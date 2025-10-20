vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
})
require('nvim-autopairs').setup({
  event = 'InsertEnter'
})

vim.pack.add({
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

vim.api.nvim_create_user_command("TinymistPin", function(opts)
  vim.lsp.buf.execute_command({ command = 'tinymist.pinMain', arguments = { vim.api.nvim_buf_get_name(0) } })
end, {})
