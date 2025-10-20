vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})
require('gitsigns').setup({
  numhl = true,
  signcolumn = false,
  attach_to_untracked = true,
  current_line_blame_opts = {
    delay = 200
  }
})

vim.keymap.set({ "n", "v" }, "<leader>gd", function()
  vim.cmd("Gitsigns toggle_current_line_blame")
  vim.cmd("Gitsigns toggle_deleted")
  vim.cmd("Gitsigns toggle_word_diff")
  vim.cmd("Gitsigns toggle_linehl")
end)
