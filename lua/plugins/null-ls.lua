return {
    {
        "stevearc/conform.nvim",
        opts = {
            -- format_on_save = {
            --     timeout_ms = 1000,
            --     lsp_fallback = true,
            -- },
            formatters_by_ft = {
                javascript = { "biome" },
                typescript = { "biome" },
                javascriptreact = { "biome" },
                typescriptreact = { "biome" },
                json = { "biome" },
                html = { "prettier" },
                css = { "prettier" },
                yaml = { "prettier" },
            },
        },
    },
    {
        "MunifTanjim/prettier.nvim",
        config = function()
            local prettier = require("prettier")

            prettier.setup({
                bin = "prettier", -- or `'prettierd'` (v0.23.3+)
                filetypes = {
                    "css",
                    "graphql",
                    "html",
                    "less",
                    "scss",
                    "yaml",
                },
            })
        end,
    },
}
