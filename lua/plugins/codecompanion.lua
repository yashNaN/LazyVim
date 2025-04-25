return {
    "olimorris/codecompanion.nvim",
    opts = {
        strategies = {
            -- Change the default chat adapter
            chat = {
                adapter = "copilot",
                inline = "copilot",
                cmd = "copilot",
                slash_commands = {
                    ["file"] = {
                        -- Location to the slash command in CodeCompanion
                        callback = "strategies.chat.slash_commands.file",
                        description = "Select a file using Telescope",
                        opts = {
                            provider = "default", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks"
                            contains_code = true,
                        },
                    },
                },
            },
        },
        adapters = {
            copilot = function()
                return require("codecompanion.adapters").extend("copilot", {
                    schema = {
                        model = {
                            default = "claude-3.7-sonnet",
                        },
                    },
                })
            end,
        },
        opts = {
            -- Set debug logging
            --log_level = "DEBUG",
        },
    },
    -- config = function()
    --         require("codecompanion").setup({
    --             strategies = {
    --                 chat = { adapter = "copilot" },
    --                 inline = { adapter = "copilot" },
    --                 cmd = { adapter = "copilot" },
    --             },
    --         })
    --     end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "zbirenbaum/copilot.lua", -- for providers='copilot'
    },
}

--- short cuts to keep in mind
--- @editor, will start editing in the #buffers you pass in
--- gr or gc to accept or reject
