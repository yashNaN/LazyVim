-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>`", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>,", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
-- remap cntrl+w to delete a buffer, Bdelete is from a plugin that simulates closig tabs like vscode
vim.keymap.set({ "n", "v", "i" }, "<C-w>", "<cmd>Bdelete<CR>", { desc = "Close buffer" })
