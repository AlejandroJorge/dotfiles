local s = { silent = true }

vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", s)
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", s)
vim.keymap.set("n", "<C-d>", "<C-d>zz", s)
vim.keymap.set("n", "<C-u>", "<C-u>zz", s)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, s)
