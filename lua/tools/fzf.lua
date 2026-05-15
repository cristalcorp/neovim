vim.pack.add{
	'https://github.com/ibhagwan/fzf-lua',
}

require('fzf-lua').setup {}

local keymap = vim.keymap.set
keymap("n", "<leader>ff",":FzfLua files<CR>",      { desc = "Find files" })
keymap("n", "<leader>fg", ":FzfLua live_grep<CR>",  { desc = "Live grep" })
keymap("n", "<leader>fb", ":FzfLua buffers<CR>",    { desc = "Buffers" })
keymap("n", "<leader>fk", ":FzfLua keymaps<CR>",    { desc = "Keymaps" })
keymap("n", "<leader>fr", ":FzfLua oldfiles<CR>",   { desc = "Recent files" }) 
