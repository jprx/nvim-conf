local servers = { "clangd", "lua_ls" }

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- got this (using vim.lsp.enable) from reading the nvchad lspconfig
      -- from reading the docs of mason-lspconfig it seems nvim 0.11 added features that
      -- make mason-lspconfig redundant because you can just use vim.lsp now
      vim.lsp.enable(servers)

      -- this is from kickstart.nvim and is what makes the inline warning messages appear
      -- (they are called "diagnostics")
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

    end
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = servers,
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    -- from kickstart, fixes LSP complaints in vim config lua code
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {},
  },
}
