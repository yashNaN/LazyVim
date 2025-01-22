return {
    "nvimdev/lspsaga.nvim",
    config = function()
        require("lspsaga").setup({
            finder = {
                max_height = 0.6,
                keys = {
                    tabe = "<cr>",
                    quit = "<Esc>",
                },
                hover = {
                    keys = {
                        quit = "<Esc>",
                    },
                },
            },
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons", -- optional
    },
}
