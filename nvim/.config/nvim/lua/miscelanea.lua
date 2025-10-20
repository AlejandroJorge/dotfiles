vim.pack.add({
  { src = "https://github.com/windwp/nvim-autopairs" },
})
require('nvim-autopairs').setup({
  event = 'InsertEnter'
})

vim.pack.add({
  { src = "https://github.com/kylechui/nvim-surround" }
})
require("nvim-surround").setup()

vim.pack.add({
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})
