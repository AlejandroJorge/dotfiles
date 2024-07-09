return {
	"ThePrimeagen/harpoon",
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "harpoon add" })
		vim.keymap.set("n", "<leader>hd", mark.rm_file, { desc = "harpoon remove" })
		vim.keymap.set("n", "<leader>hc", mark.clear_all, { desc = "harpoon clear" })
		vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, { desc = "harpoon menu" })
		vim.keymap.set("n", "<leader>hn", ui.nav_next, { desc = "harpoon next" })
		vim.keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "harpoon prev" })
	end,
}
