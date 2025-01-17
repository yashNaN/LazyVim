return {
    { "github/copilot.vim" },
    {
        -- Used for sticky scroll like behavior from vscode
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" }, -- Load when a file is opened
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Ensure Tree-sitter is loaded first
        config = function()
            require("treesitter-context").setup({
                enable = true, -- Enable this plugin (can be toggled later with commands)
                max_lines = 3, -- Show as many context lines as fit on screen
                min_window_height = 0, -- Do not enable if the window is shorter than this
                line_numbers = true, -- Show line numbers for context
                multiline_threshold = 20, -- Maximum number of lines to collapse for a single context
                trim_scope = "outer", -- Remove outermost context if max_lines is exceeded
                mode = "cursor", -- Line used to calculate context: 'cursor' or 'topline'
                separator = nil, -- Optional separator between context and content
                zindex = 20, -- Z-index of the context window
                on_attach = nil, -- Callback when context is attached to a buffer
            })
        end,
    },
    { -- for auto completion
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP completion source
            "hrsh7th/cmp-buffer", -- Buffer completion source
            "hrsh7th/cmp-path", -- File path completion source
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For vsnip users
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" }, -- Enable LSP source
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },
    {
        -- for closing buffers without closing windows
        "famiu/bufdelete.nvim",
        lazy = false,
    },
    -- For menus in neovim
    { "nvzone/volt", lazy = true },
    { "nvzone/menu", lazy = true },
    -- lazy.nvim
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            dashboard = {
                sections = {
                    { section = "header" },
                    {
                        pane = 2,
                        section = "terminal",
                        cmd = "colorscript -e square",
                        height = 5,
                        padding = 1,
                    },
                    { section = "keys", gap = 1, padding = 1 },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Recent Files",
                        section = "recent_files",
                        indent = 2,
                        padding = 1,
                    },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return Snacks.git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { section = "startup" },
                },
                -- your dashboard configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
        },
    },
}
