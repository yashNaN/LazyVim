return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          -- point to your preferred binary:
          cmd = { "/scratch/bazel/36bac8ee52e5d1559627454b12aa1b28/external/clang-21.1.1-x86_64/bin/clangd", "--background-index", "--clang-tidy","--header-insertion=iwyu", },
          capabilities = (function()
            local caps = vim.lsp.protocol.make_client_capabilities()
            caps.offsetEncoding = { "utf-16" }
            local ok, cmp = pcall(require, "cmp_nvim_lsp")
            if ok then caps = cmp.default_capabilities(caps) end
            return caps
          end)(),
        },
      },
    },
  },
}
-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       -- Ensure mason installs the server
--       clangd = {
--         keys = {
--           { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
--         },
--         root_markers = {
--           ".clangd",
--           ".clang-tidy",
--           ".clang-format",
--           "compile_commands.json",
--           "compile_flags.txt",
--           "configure.ac", -- AutoTools
--           "Makefile",
--           "configure.ac",
--           "configure.in",
--           "config.h.in",
--           "meson.build",
--           "meson_options.txt",
--           "build.ninja",
--           ".git",
--         },
--         capabilities = {
--           offsetEncoding = { "utf-16" },
--         },
--         cmd = {
--           "/scratch/bazel/36bac8ee52e5d1559627454b12aa1b28/external/clang-21.1.1-x86_64/bin/clangd",
--           "--background-index",
--           "--clang-tidy",
--           "--header-insertion=iwyu",
--           "--completion-style=detailed",
--           "--function-arg-placeholders",
--           "--fallback-style=llvm",
--         },
--         init_options = {
--           usePlaceholders = true,
--           completeUnimported = true,
--           clangdFileStatus = true,
--         },
--       },
--     },
--     setup = {
--       clangd = function(_, opts)
--         local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
--         require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
--         return false
--       end,
--     },
--   },
-- }
