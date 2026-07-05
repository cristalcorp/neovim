-- ── Diagnostics UI ───────────────────────────────────────────
vim.diagnostic.config({
    virtual_text  = { prefix = '●', spacing = 4 },
    signs         = true,
    underline     = true,
    severity_sort = true,
    float         = { border = 'rounded', source = true },
})

-- ── LSP keymaps (à l'attach) ─────────────────────────────────
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local buf = ev.buf
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
        end

        map('n', 'gd',         vim.lsp.buf.definition,      'Go to definition')
        map('n', 'gD',         vim.lsp.buf.declaration,      'Go to declaration')
        map('n', 'gi',         vim.lsp.buf.implementation,   'Go to implementation')
        map('n', 'gr',         vim.lsp.buf.references,       'References')
        map('n', 'gt',         vim.lsp.buf.type_definition,  'Type definition')
        map('n', 'K',          vim.lsp.buf.hover,            'Hover doc')
        map('n', '<C-k>',      vim.lsp.buf.signature_help,   'Signature help')
        map('n', '<leader>rn', vim.lsp.buf.rename,           'Rename')
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
        map('n', '<leader>f',  function()
            vim.lsp.buf.format({ async = false })
        end, 'Format buffer')
        map('n', '[d', vim.diagnostic.goto_prev,      'Prev diagnostic')
        map('n', ']d', vim.diagnostic.goto_next,      'Next diagnostic')
        map('n', '<leader>e', vim.diagnostic.open_float, 'Diagnostic float')

        -- Inlay hints toggle
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = buf })
            map('n', '<leader>ih', function()
                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
                vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
            end, 'Toggle inlay hints')
        end
    end,
})

-- ── rust-analyzer (vim.lsp.config — API native 0.12) ─────────
-- Prérequis : rustup component add rust-analyzer
vim.lsp.config('rust_analyzer', {
    -- cmd          = { 'rust-analyzer' },
    cmd = { vim.fn.expand('~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer') },
    filetypes    = { 'rust' },
    root_markers = { 'Cargo.toml', 'Cargo.lock', '.git' },
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures  = true,
                buildScripts = { enable = true },
            },
            checkOnSave = true,
            check = {
                command = 'clippy',
            },
            procMacro = {
                enable = true,
            },
            inlayHints = {
                parameterHints         = { enable = true },
                typeHints              = { enable = true },
                chainingHints          = { enable = true },
                closureReturnTypeHints = { enable = 'with_block' },
                lifetimeElisionHints   = { enable = 'skip_trivial' },
            },
        },
    },
})

vim.lsp.enable('rust_analyzer')

-- ── Format à la sauvegarde ───────────────────────────────────
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern  = '*.rs',
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

