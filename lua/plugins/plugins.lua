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
        enabled = true,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP completion source
            "hrsh7th/cmp-buffer", -- Buffer completion source
            "hrsh7th/cmp-path", -- File path completion source
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = {
                    { name = "nvim_lsp" }, -- Enable LSP source
                    { name = "buffer" },
                    -- { name = "path" },
                },
                experimental = {
                    ghost_text = true, -- Enable ghost text
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
    { "nvzone/volt", lazy = true, enabled = false },
    {
        "nvzone/menu",
        lazy = true,
        enabled = false,
        dependenceis = {
            "nvimdev/lspsaga.nvim",
        },
        config = function() end,
    },
    -- For autocorrect
    {
        "https://github.com/ck-zhang/mistake.nvim",
    },
    -- copilot chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        enabled = false,
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
            model = "gpt-4o",
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
    -- typescript lsp
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {
            settings = {
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = "none",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = false,
                    includeInlayPropertyDeclarationTypeHints = false,
                    includeInlayFunctionLikeReturnTypeHints = false,
                    includeInlayEnumMemberValueHints = false,
                },
                tsserver_format_options = {
                    allowIncompleteCompletions = false,
                    allowRenameOfImportPath = false,
                },
                expose_as_code_action = { "fix_all", "organize_imports", "add_missing_imports", "remove_unused" },
            },
            root_dir = function(fname)
                local util = require("lspconfig.util")
                return util.root_pattern(".git")(fname)
            end,
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = true,
    },
    {
        "mikesmithgh/kitty-scrollback.nvim",
        enabled = true,
        lazy = true,
        cmd = {
            "KittyScrollbackGenerateKittens",
            "KittyScrollbackCheckHealth",
            "KittyScrollbackGenerateCommandLineEditing",
        },
        event = { "User KittyScrollbackLaunch" },
        -- version = '*', -- latest stable version, may have breaking changes if major version changed
        -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
        config = function()
            require("kitty-scrollback").setup()
        end,
    },
}
