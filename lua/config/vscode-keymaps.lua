-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>`", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-`>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>,", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
-- remap cntrl+w to delete a buffer, Bdelete is from a plugin that simulates closig tabs like vscode
vim.keymap.set({ "n", "v", "i" }, "<C-w>", "<cmd>Bdelete<CR>", { desc = "Close buffer" })

-- remap contrl+n to create a new file with passed in name
vim.keymap.set("n", "<C-n>", ":e ", { desc = "Edit a file" })

vim.keymap.set("v", "<C-/>", function()
    vim.cmd.norm("gc")
end)

-- Use ls-saga for function definitions
vim.keymap.set("n", "vd", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show hover definition" })
vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })

-- Change q from macro recording to moving back one word
vim.keymap.set("n", "q", "b", { noremap = true, silent = true })
