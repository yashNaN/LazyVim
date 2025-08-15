-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
    -- VSCode Neovim
    return
end

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

-- Helper function to find project root
local function find_project_root()
    local root_markers = { ".git", "Makefile", "pyproject.toml", "go.mod" }
    local current_file = vim.fn.expand("%:p:h")

    for _, marker in ipairs(root_markers) do
        local root = vim.fn.finddir(marker, current_file .. ";")
        if root ~= "" then
            return vim.fn.fnamemodify(root, ":h")
        end
        root = vim.fn.findfile(marker, current_file .. ";")
        if root ~= "" then
            return vim.fn.fnamemodify(root, ":h")
        end
    end

    return vim.lsp.buf.list_workspace_folders()[1] or vim.fn.getcwd()
end

vim.keymap.set("n", "<C-p>", function()
    require("telescope.builtin").oldfiles({
        cwd = find_project_root(),
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
    require("menu").open("default", { mouse = true })
end, { desc = "open menu" })

vim.keymap.set({ "n", "i" }, "<leader>k", function()
    vim.diagnostic.open_float()
end, { desc = "Expand error dialogue" })

-- Function for commenting
vim.keymap.set("v", "<C-/>", function()
    vim.cmd.norm("gc")
end)

-- Use ls-saga for function definitions
vim.keymap.set("n", "vd", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show hover definition" })
vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })

-- TypeScript imports
vim.keymap.set("n", "<leader>ci", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add Missing Imports" })

-- Change q from macro recording to moving back one word
vim.keymap.set("n", "q", "b", { noremap = true, silent = true })

-- Open copilot chat
vim.keymap.set("n", "<leader>p", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle copilot chat" })

-- Disable the below if using avante instead of code companion
vim.keymap.set("n", "<leader>p", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "Toggle code companion " })
vim.keymap.set(
    { "n", "v", "i" },
    "<leader>am",
    "<cmd>CodeCompanionActions<CR>",
    { noremap = true, desc = "CodeCompanion: Open companion menu " }
)
vim.keymap.set(
    { "v" },
    "<Leader>ac",
    "<cmd>CodeCompanionChat Add<CR>",
    { noremap = true, silent = true, desc = "CodeCompanion: Add selection to chat" }
)
