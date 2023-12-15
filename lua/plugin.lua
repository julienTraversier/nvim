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
  {
    "romgrk/barbar.nvim",
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
  },
  {
    {
      "kdheepak/lazygit.nvim",
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("telescope").load_extension("lazygit")
      end
    }
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "rhysd/git-messenger.vim"
  },
  {
    "jiangmiao/auto-pairs",
  },
  {
    'petobens/poet-v'
  },
  {
    'freddiehaddad/feline.nvim',
    opts = {},
  },
  {
    "ggandor/leap.nvim"
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
   "karb94/neoscroll.nvim"
  }
}
