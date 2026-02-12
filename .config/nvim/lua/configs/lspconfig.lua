vim.lsp.config('*', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Enhanced gopls configuration
vim.lsp.config('gopls', {
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

local servers = { "html", "cssls", "phpactor", "gopls", "jsonls", "intelephense", "ts_ls" }
vim.lsp.enable(servers)

require("java").setup()
vim.lsp.enable("jdtls")
