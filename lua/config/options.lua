-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Capture the directory nvim was launched from before anything can change cwd
vim.g.initial_cwd = vim.fn.getcwd()
vim.opt.relativenumber = false
vim.g.autoformat = true

-- spell checking
vim.opt.spell = true
vim.opt.spelllang = { "en_us" } -- You can change this to "en_gb", "es"

vim.opt.clipboard = "unnamedplus"

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
