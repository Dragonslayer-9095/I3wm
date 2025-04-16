-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--   },
-- }
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- or "latte", "frappe", "macchiato"
      integrations = {
        neotree = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        treesitter = true,
        telescope = true,
        which_key = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        mason = true,
        lsp_trouble = true,
        noice = true,
        notify = true,
        mini = true,
      },
    },
  },
}
