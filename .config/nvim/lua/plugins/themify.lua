return {
  "lmantw/themify.nvim",

  lazy = false,
  priority = 999,

  config = function()
    require("themify").setup({
      -- Your list of colorschemes.

      "folke/tokyonight.nvim",
      "Yazeed1s/minimal.nvim",
      "sainnhe/gruvbox-material",
      "kvrohit/substrata.nvim",
      {
        "sho-87/kanagawa-paper.nvim",

        branch = "master",
      },

      -- Built-in colorschemes are also supported.
      -- (Also works with any colorschemes that are installed via other plugin manager, just make sure the colorscheme is loaded before Themify is loaded.)
      "default",
    })
  end,
}
