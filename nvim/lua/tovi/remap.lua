vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>pf", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>sq", "ZZ")
vim.keymap.set("n", "<leader>s", [[:w<CR>]])
vim.keymap.set("n", "<leader>q", [[:q<CR>]])
--===========================================================
vim.keymap.set("n", "<C-h>", [[:TmuxNavigateLeft<CR>]])
vim.keymap.set("n", "<C-l>", [[:TmuxNavigateRight<CR>]])
vim.keymap.set("n", "<C-j>", [[:TmuxNavigateDown<CR>]])
vim.keymap.set("n", "<C-k>", [[:TmuxNavigateUP<CR>]])
--========================================================== Moving Lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--===========================================================
--===========================================================
--Minor shi
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
--===========================================================
-- next greatest remap ever : asbjornHaland  ||||COPY||||
--===========================================================
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
--===========================================================
--Delete to void reg
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
--===========================================================
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<C-z>", "<nop>")
