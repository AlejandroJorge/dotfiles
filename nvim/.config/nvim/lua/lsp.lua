vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/Saghen/blink.cmp" }
})

require("mason").setup()

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
  ensure_installed = {
    "terraformls",
    "ts_ls",
    "basedpyright",
    "ruff",
    "tailwindcss",
    "clangd",
    "gopls",
    "lua_ls",
    "texlab"
  },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = require("blink.cmp").get_lsp_capabilities()
      })
    end,
  }
})

vim.lsp.config.tailwindcss = {
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
}

vim.lsp.config.gopls = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    gopls = {
      ["ui.inlayhint.hints"] = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        parameterNames = true,
        functionTypeParameters = true,
        ignoredError = true,
        rangeVariableTypes = true,
      }
    }
  }
}

vim.lsp.config.basedpyright = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    basedpyright = {
      analysis = {
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
          callArgumentNames = "all",
          genericTypes = true,
        },
      },
    },
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          reportUnusedVariable = "none",
          reportUnusedImport = "none",
          reportImportCycles = "none",
          reportShadowedImports = "none",
        },
      },
    },
  },
}

vim.lsp.config.clangd = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    clangd = {
      InlayHints = {
        Enabled = true,
        ParameterNames = true,
        DeducedTypes = true,
        Designators = true,
      }
    }
  }
}

vim.api.nvim_create_user_command("LspFormat", function(_)
  if vim.lsp.get_clients({ bufnr = 0, method = "textDocument/formatting" }) then
    vim.lsp.buf.format()
  end
end, { nargs = 0 })

require("blink.cmp").setup({
  keymap = { preset = "default" },
  fuzzy = { implementation = "lua" }
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.lsp.inlay_hint.enable(true)

vim.cmd("highlight MasonNormal guibg=none")
