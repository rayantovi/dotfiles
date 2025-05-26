return {
  "tpope/vim-fugitive",
  event = { "VeryLazy" },
  config = function()
    -- Optionally set up some basic mappings for common fugitive commands
    vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Fugitive: Git status" })
    vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Fugitive: Git commit" })
    vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Fugitive: Git push" })
  end,
}
