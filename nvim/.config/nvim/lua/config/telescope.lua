vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

local builtin = require("telescope.builtin")

local curr_buff_diagnostics = function() builtin.diagnostics({ bufnr = 0 }) end
local curr_buff_live_grep = function() builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") } }) end

-- Files
vim.keymap.set('n', "<leader>ff", builtin.find_files)
vim.keymap.set('n', "<leader>gf", builtin.git_files)

-- Grep
vim.keymap.set('n', "<leader>lg", builtin.live_grep)
vim.keymap.set({ 'n', 'v' }, "<leader>bg", curr_buff_live_grep)

-- LSP
vim.keymap.set({ 'n', 'v' }, "gd", builtin.lsp_definitions)
vim.keymap.set({ 'n', 'v' }, "gr", builtin.lsp_references)
vim.keymap.set('n', "<leader>dg", curr_buff_diagnostics)

-- Others
vim.keymap.set('n', "<leader>bf", builtin.buffers)
vim.keymap.set('n', "<leader>mn", builtin.man_pages)
