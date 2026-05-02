local lspconfig = require('lspconfig')

-- Basedpyright
lspconfig.basedpyright.setup({
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard", -- off / basic / standard / strict / all
      }
    }
  }
})

-- Ruff (linting + formatting)
lspconfig.ruff.setup({})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ name = "ruff" })
  end,
})
