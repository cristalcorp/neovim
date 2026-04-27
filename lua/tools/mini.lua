vim.pack.add {
  "https://github.com/echasnovski/mini.nvim"
}

require("mini.clue").setup({
  triggers = {
    { mode = "n", keys = "g" },  -- affiche les combos après "g"
    { mode = "n", keys = "<leader>" },
  },
})
