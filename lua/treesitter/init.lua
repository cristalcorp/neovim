vim.pack.add {
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
}

require('nvim-treesitter').setup {
    ensure_installed = { 'python', 'rust', 'go', 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline' },
    highlight = { enable = true },
}
