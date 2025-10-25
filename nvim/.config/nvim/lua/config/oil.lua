vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/refractalize/oil-git-status.nvim" },
  { src = "https://github.com/nvim-mini/mini.nvim" }
})

require("mini.icons").setup()

require("oil").setup({
  keymaps = {
    ["<BS>"] = { "actions.parent", mode = "n" },
    ["<leader>hf"] = { "actions.toggle_hidden", mode = "n" }
  },
  delete_to_trash = false,
  win_options = {
    signcolumn = "yes:2"
  }
})

require("oil-git-status").setup({})

vim.keymap.set("n", "<leader>ft", "<CMD>Oil<CR>", { silent = true })
