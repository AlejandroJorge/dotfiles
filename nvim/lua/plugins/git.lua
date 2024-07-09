return {
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Actions
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "stage git hunk" })

				map("n", "<leader>bs", function()
					gs.stage_buffer()
				end, { desc = "stage git buffer" })

				map("n", "<leader>hu", function()
					gs.undo_stage_hunk()
				end, { desc = "undo stage git hunk" })

				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "reset git hunk" })

				map("n", "<leader>br", function()
					gs.reset_buffer()
				end, { desc = "reset git buffer" })
			end,
		},
	},
}
