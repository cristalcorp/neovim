require("options.keymaps")

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

-- ── Open at the last line ──────────────────────────────────────
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
