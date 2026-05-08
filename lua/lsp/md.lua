-- Formatter
vim.pack.add{
	'https://github.com/dhruvasagar/vim-table-mode',
}

-- Auto activate table mode
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.cmd('TableModeEnable')
  end,
})

-- LSP
vim.lsp.config('marksman', {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
})

vim.lsp.enable({ 'marksman' })
