require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true, -- Show diagnostic text at end of line
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Auto-open diagnostic float when cursor is on a line with diagnostics
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- Set updatetime for faster diagnostic popup (default is 4000ms)
vim.o.updatetime = 250
