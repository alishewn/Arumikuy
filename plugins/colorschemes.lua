return {
  {
    "Mofiqul/vscode.nvim",
    event = "VeryLazy",
    name = "vscode",
    opts = {},
  },
  {
    "EdenEast/nightfox.nvim",
    event = "VeryLazy",
    name = "nightfox",
    opts = {},
  },
  {
    'AlexvZyl/nordic.nvim',
    name = "nordic",
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.load()
    end
  },
}
