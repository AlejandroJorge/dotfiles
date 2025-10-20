vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim" }
})

local telescope = require("telescope")

telescope.setup({
  extensions = {
    file_browser = {
      hijack_netrw = true,
    }
  }
})

telescope.load_extension("file_browser")

local builtin = require("telescope.builtin")
local file_browser = require("telescope").extensions.file_browser.file_browser

local curr_buff_diagnostics = function() builtin.diagnostics({ bufnr = 0 }) end
local curr_buff_live_grep = function() builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") } }) end
local open_file_browser_normal_mode = function()
  file_browser({ initial_mode = "normal" })
end

-- Files
vim.keymap.set('n', "<leader>ff", builtin.find_files)
vim.keymap.set('n', "<leader>gf", builtin.git_files)
vim.keymap.set('n', "<leader>fb", open_file_browser_normal_mode)

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
