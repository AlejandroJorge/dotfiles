return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "c", "lua", "go", "bash", "zig", "javascript", "typescript", "html", "python" },
		sync_install = false,
		auto_install = true,
		autotag = true,
		highlight = {
			enable = true,
		},
	},
}
