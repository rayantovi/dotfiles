return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({}) -- optional custom setup
    local map = vim.keymap.set
    local opts = { silent = true, noremap = true }
    -- File & search
    map("n", "<leader>f", function() fzf.files() end, { desc = "Find Files" })
    map("n", "<leader>lg", function() fzf.live_grep() end, { desc = "Live Grep" })
    -- LSP bindings
    map("n", "<leader>ld", function() fzf.diagnostics_document() end, { desc = "LSP Diagnostics" })
    map("n", "<leader>lr", function() fzf.lsp_references() end, { desc = "LSP References" })
  end,
}

