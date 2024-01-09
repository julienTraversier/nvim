return {
  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
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
    'ms-jpq/chadtree'
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
  },
  {
    'mfussenegger/nvim-lint'
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { "yamatsum/nvim-cursorline" },
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    config = function()
      require('venv-selector').setup {
        -- Your options go here
        -- name = "venv",
        -- auto_refresh = false
      }
    end,
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "ThePrimeagen/harpoon"
  }
}
