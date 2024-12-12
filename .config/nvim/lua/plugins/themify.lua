return {
  "lmantw/themify.nvim",

  lazy = false,
  priority = 999,

  config = function()
    require("themify").setup({
      -- Your list of colorschemes.
      "0xstepit/flow.nvim",
      "folke/tokyonight.nvim",
      "kvrohit/substrata.nvim",
      { "bluz71/vim-moonfly-colors", branch = "master" },
      { "sho-87/kanagawa-paper.nvim", branch = "master" },
      { "sainnhe/gruvbox-material", branch = "master" },
      { "sainnhe/everforest", branch = "master" },

      -- Built-in colorschemes are also supported.
      -- (Also works with any colorschemes that are installed via other plugin manager, just make sure the colorscheme is loaded before Themify is loaded.)
      "default",
    })
  end,
}
