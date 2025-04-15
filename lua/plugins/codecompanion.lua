return {
    "olimorris/codecompanion.nvim",
    opts = {},
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = { adapter = "copilot" },
                inline = { adapter = "copilot" },
                cmd = { adapter = "copilot" },
            },
        })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "zbirenbaum/copilot.lua", -- for providers='copilot'
    },
}

--- short cuts to keep in mind
--- @editor, will start editing in the #buffers you pass in
--- gr or gc to accept or reject
