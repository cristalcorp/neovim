-- ── Packages ─────────────────────────────────────────────────

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

-- ── Options ───────────────────────────────────────────────────
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.undofile       = true
vim.opt.clipboard      = "unnamedplus"

-- ── Yank highlight ────────────────────────────────────────────
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})

