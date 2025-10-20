vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }
})

require("nvim-tree").setup({
  sort = {
    sorter = "filetype",
  },
  view = {
    side = "right",
    width = 60,
    centralize_selection = true
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
    vim.keymap.set("n", "<TAB>", api.node.open.preview, opts)
    vim.keymap.set("n", "c", api.fs.create, opts)
    vim.keymap.set("n", "r", api.fs.rename_sub, opts)
    vim.keymap.set("n", "d", api.fs.trash, opts)
    vim.keymap.set("n", "gf", api.tree.toggle_gitignore_filter, opts)
    vim.keymap.set("n", "hf", api.tree.toggle_hidden_filter, opts)

    vim.keymap.set("n", "<C-r>", function()
      vim.cmd("cd " .. api.tree.get_node_under_cursor().absolute_path)
      api.tree.change_root_to_node()
    end, opts)
  end,
})

vim.keymap.set("n", "<leader>tt", require("nvim-tree.api").tree.toggle, { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ "QuitPre" }, {
  callback = function()
    vim.cmd("NvimTreeClose")
  end,
})

vim.cmd("hi NvimTreeNormal guibg=NONE")
