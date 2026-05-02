-- -- SuperHTML is a Zig html parser
-- vim.lsp.config('superhtml', {
--   cmd = { 'superhtml', 'lsp' },
--   filetypes = { 'html' },
-- })
--
-- vim.lsp.enable('superhtml')

-- vscode-html-language-server provided by npm
vim.lsp.config('html', {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  init_options = {
    provideFormatter = true,
  },
})

vim.lsp.enable('html')
