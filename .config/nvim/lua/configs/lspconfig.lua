vim.lsp.config('*', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

local servers = { "html", "cssls", "phpactor", "gopls", "jsonls", "intelephense", "ts_ls" }
vim.lsp.enable(servers)

require("java").setup()
vim.lsp.enable("jdtls")
