return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				c = {
					require("formatter.filetypes.c").clangformat,
				},
				zig = {
					require("formatter.filetypes.zig").zigfmt,
				},
				go = {
					require("formatter.filetypes.go").gofumpt,
					require("formatter.filetypes.go").goimports,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettierd,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettierd,
				},
				javascriptreact = {
					require("formatter.filetypes.javascriptreact").prettierd,
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").prettierd,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				vim.cmd("FormatWrite")
			end,
		})
	end,
}
