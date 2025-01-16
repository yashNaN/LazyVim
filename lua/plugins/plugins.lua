return {
  { "github/copilot.vim" },
  {
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
  {
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
}
