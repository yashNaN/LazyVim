return {
  "ibhagwan/fzf-lua",
  opts = {
    pickers = {
      oldfiles = {
        prompt = "Recently Accessed Files❯ ",
        cwd_only = false, -- Set to true if you only want recently accessed files in the current working directory
        previewer = true, -- Enable file preview
        fzf_opts = {
          ["--layout"] = "reverse", -- Reverse layout for a more VSCode-like feel
        },
      },
    },
  },
}
