-- ===========================================================
-- PLUGIN MANAGER SETUP
-- ===========================================================

-- Lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw and colors
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Setup plugins
require("lazy").setup({ import = "plugins" })

-- ===========================================================
-- SETTINGS
-- ===========================================================

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Tabspace
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 2

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamed,unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Terminal colors
vim.o.termguicolors = true

-- Highlight while yanking
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- ===========================================================
-- KEYMAPS
-- ===========================================================

-- Simple buffer management
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save buffer" })

-- Scrolling and centering
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Diagnostic
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- vim: ts=2 sts=2 sw=2 et
