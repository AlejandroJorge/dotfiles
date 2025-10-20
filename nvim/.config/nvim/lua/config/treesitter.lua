vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})
require('nvim-treesitter').setup({
  sync_install = false,
  auto_install = true,
  autotag = true,
  highlight = {
    enable = true,
  },
})
