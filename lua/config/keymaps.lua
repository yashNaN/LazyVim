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
-- remap contrl+n to create a new file with passed in name using neo-tree, but this doesn't change the window the new file
-- vim.keymap.set("n", "<C-n>", function()
--   local nt = require("neo-tree.sources.filesystem.commands")
--   local new_file_path = nt.add(require("neo-tree.sources.manager").get_state("filesystem"))
--   require("neo-tree.sources.filesystem.commands").open(new_file_path)
-- end, { desc = "New file in Neo-tree" })
--

-- vim.keymap.set("n", "<C-p>", function()
--   require("telescope.builtin").find_files({
--     cwd = vim.lsp.buf.list_workspace_folders()[1] or vim.fn.getcwd(),
--     hidden = true, -- Include hidden files
--   })
-- end, { desc = "Find files from root directory" })

vim.keymap.set("n", "<C-p>", function()
    require("telescope.builtin").oldfiles({
        cwd = vim.lsp.buf.list_workspace_folders()[1] or vim.fn.getcwd(),
        hidden = true, -- Include hidden files
    })
end, { desc = "Find from recently used files" })

vim.keymap.set("n", "<C-S-f>", require("fzf-lua").live_grep, { desc = "fzf-lua live grep" })

vim.keymap.set("n", "<C-f>", function()
    require("telescope.builtin").live_grep({
        grep_open_files = true,
        search_dirs = { vim.fn.expand("%:p") },
    })
end, { desc = "Live grep in current file" })

vim.keymap.set("n", "<leader>m", function()
    require("menu").open("default")
end, { desc = "open menu" })

-- mouse users + nvimtree users!
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
    require("menu.utils").delete_old_menus()

    vim.cmd.exec('"normal! \\<RightMouse>"')

    -- clicked buf
    local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
    local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

    require("menu").open(options, { mouse = true })
end, {})

vim.keymap.set({ "n", "i" }, "<leader>k", function()
    vim.diagnostic.open_float()
end, { desc = "Expand error dialogue" })
