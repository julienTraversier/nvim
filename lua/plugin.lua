return {
  -- Alpha (Dashboard)
  {
    "goolord/alpha-nvim",
    lazy = true,
  },
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-latte'
    end
  },
  -- Toggle Term
  -- Added this plugin.
  {
    'akinsho/toggleterm.nvim',
    tag = "*",
    config = true
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
}
