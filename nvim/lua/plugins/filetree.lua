return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local api = require("nvim-tree.api")

		local function custom_on_attach(bufnr)
			local function opts(desc)
				return { desc = "FileTree " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "<C-r>", api.tree.change_root_to_node, opts("Change root"))
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open file"))
			vim.keymap.set("n", "<TAB>", api.node.open.preview, opts("Preview file"))
			vim.keymap.set("n", "c", api.fs.create, opts("Create file"))
			vim.keymap.set("n", "r", api.fs.rename_sub, opts("Create file"))
			vim.keymap.set("n", "D", api.fs.remove, opts("Trash"))
			vim.keymap.set("n", "d", api.fs.trash, opts("Delete"))
			vim.keymap.set("n", "gf", api.tree.toggle_gitignore_filter, opts("Git ignore filter"))
			vim.keymap.set("n", "hf", api.tree.toggle_hidden_filter, opts("Hidden files filter"))
		end

		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				side = "right",
				width = 40,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
			on_attach = custom_on_attach,
		})

		vim.keymap.set("n", "<leader>tt", api.tree.toggle, { desc = "Toggle filetree", noremap = true, silent = true })

		vim.api.nvim_create_autocmd({ "QuitPre" }, {
			callback = function()
				vim.cmd("NvimTreeClose")
			end,
		})
	end,
}
