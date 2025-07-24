return {
    { "nvim-lua/plenary.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                -- VSCode-like prompt and layout
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                    preview_width = 0.5,
                },
                sorting_strategy = "ascending",
                prompt_prefix = "🔍 ", -- VSCode-style search icon
                selection_caret = "❯ ",
                path_display = { "truncate" },

                -- Enable preview for files
                file_ignore_patterns = { ".git/" },


                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next", -- Ctrl+j to navigate down
                        ["<C-k>"] = "move_selection_previous", -- Ctrl+k to navigate up
                        ["<C-h>"] = "preview_scrolling_up", -- Ctrl+h to scroll preview up
                        ["<C-l>"] = "preview_scrolling_down", -- Ctrl+l to scroll preview down
                        ["<C-q>"] = "close", -- Ctrl+q to close Telescope
                        -- Scroll preview with the mouse wheel
                    },
                    n = {
                        -- Scroll preview with the mouse wheel in normal mode
                    },
                },
            },
            pickers = {
                -- Customize default pickers
                find_files = {
                    hidden = true, -- Show hidden files
                    mru = true,
                    find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*" },
                    --                   cwd_only = true,
                    find_root = true,
                },
                oldfiles = {
                    prompt_title = "Recently Opened Files",
                    hidden = true,
                    --                  cwd_only = true,
                    find_root = true,
                },
                live_grep = {
                    prompt_title = "Search",
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
            },
            extensions = {
                -- Add additional Telescope extensions here
            },
        },
    },
}
