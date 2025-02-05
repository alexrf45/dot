-- return {
--   "loctvl842/monokai-pro.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme monokai-pro-spectrum")
--   end,
--   { "dasupradyumna/midnight.nvim", lazy = false, priority = 1001 },
-- }
--
-- return {
--
-- return {
--   "sainnhe/gruvbox-material",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Optionally configure and load the colorscheme
--     -- directly inside the plugin declaration.
--     vim.g.gruvbox_material_enable_italic = true
--     vim.cmd.colorscheme("gruvbox-material")
--   end,
-- }

return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd("colorscheme github_dark_high_contrast")
  end,
}
