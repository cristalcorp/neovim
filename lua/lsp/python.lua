-- Basedpyright
vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
      }
    }
  }
})
vim.lsp.enable('basedpyright')

-- Ruff
vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
})
vim.lsp.enable('ruff')
