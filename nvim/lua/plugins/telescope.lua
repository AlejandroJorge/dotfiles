return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local function find_git_root()
			-- Use the current buffer's path as the starting point for the git search
			local current_file = vim.api.nvim_buf_get_name(0)
			local current_dir
			local cwd = vim.fn.getcwd()
			-- If the buffer is not associated with a file, return nil
			if current_file == "" then
				current_dir = cwd
			else
				-- Extract the directory from the current file's path
				current_dir = vim.fn.fnamemodify(current_file, ":h")
			end

			-- Find the Git root directory from the current file's path
			local git_root =
				vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
			if vim.v.shell_error ~= 0 then
				print("Not a git repository. Searching on current working directory")
				return cwd
			end
			return git_root
		end

		local function live_grep_git_root()
			local git_root = find_git_root()
			if git_root then
				require("telescope.builtin").live_grep({
					search_dirs = { git_root },
				})
			end
		end

		vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
		vim.keymap.set("n", "<leader>gr", builtin.live_grep, { desc = "Find files" })
		vim.keymap.set("n", "<leader>gg", live_grep_git_root, { desc = "Git grep" })
	end,
}
