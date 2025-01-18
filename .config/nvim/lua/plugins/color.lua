-- return {
--   "RRethy/base16-nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("base16-irblack")
--     vim.g.edge_enable_italic = true
--     -- require("base16-colorscheme").setup({
--     --   base00 = "#292418", -- Background
--     --   base01 = "#292418", -- Lighter Background
--     --   base02 = "#665c54", -- Selection Background
--     --   base03 = "#504945", -- Comments, Invisible
--     --   base04 = "#665c54", -- Dark Foreground
--     --   base05 = "#bdae93", -- Default Foreground
--     --   base06 = "#d5c4a1", -- Light Foreground
--     --   base07 = "#fbf1c7", -- Lightest Foreground
--     --   base08 = "#fb4934", -- Red
--     --   base09 = "#fe8019", -- Orange
--     --   base0A = "#fabd2f", -- Yellow
--     --   base0B = "#b8bb26", -- Green
--     --   base0C = "#8ec07c", -- Aqua/Cyan
--     --   base0D = "#83a598", -- Blue
--     --   base0E = "#d3869b", -- Purple
--     --   base0F = "#d65d0e", -- Brown
--     -- })
--     -- Optionally configure and load the colorscheme
--     -- directly inside the plugin declaration.
--   end,
-- }

return {
  "sho-87/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme kanagawa-paper")
  end,
}
