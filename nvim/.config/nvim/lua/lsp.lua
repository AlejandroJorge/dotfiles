vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/Saghen/blink.cmp" }
})

require("mason").setup()

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = require("blink.cmp").get_lsp_capabilities()
      })
    end
  }
})

lspconfig.tailwindcss.setup({
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          [[cva\(([^)]*)\)]],
          [[cx\(([^)]*)\)]],
          [[clsx\(([^)]*)\)]],
          [[clsx\(([^)]*)\)]],
          [["']([^"']*)['"]]
        }
      }
    }
  }
})

vim.api.nvim_create_user_command("LspFormat", function(_)
  if vim.lsp.get_clients({ bufnr = 0, method = "textDocument/formatting" }) then
    vim.lsp.buf.format()
  end
end, { nargs = 0 })

require("blink.cmp").setup({
  keymap = { preset = "default" },
  fuzzy = { implementation = "lua" }
})

vim.cmd("highlight MasonNormal guibg=none")
