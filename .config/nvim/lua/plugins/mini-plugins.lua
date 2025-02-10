return {
  {
    "echasnovski/mini.starter",
    version = "*",
    lazy = false,
    priority = 1000,
    opts = {
      header = "Fr3d",
      footer = "home lab",
      items = {
        { name = "Edit new buffer", action = "enew", section = "Commands" },
        { name = "Quit Neovim", action = "qall", section = "Commands" },
        { name = "Open Terminal", action = "terminal", section = "Commands" },
        { name = "Open files", action = "FzfLua files", section = "Commands" },
      },
      function()
        require("mini.starter").setup()
      end,
    },
  },
  { "echasnovski/mini.statusline", version = "*" },
}
