-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.vscode then
    -- VSCode Neovim
    require("confige.vscode-keymaps")
else
    -- Ordinary Neovim
end

vim.o.autochdir = true
vim.o.mouse = "a"
vim.o.mousemoveevent = true
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
