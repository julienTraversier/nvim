return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {}
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
      'lukas-reineke/cmp-under-comparator',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },

        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
  },
  --'freddiehaddad/feline.nvim',
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { 'echasnovski/mini.icons' },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  -- Colorscheme
  'folke/tokyonight.nvim',
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
  },
  'nvim-tree/nvim-tree.lua',
  {
    {
      'kdheepak/lazygit.nvim',
      dependencies = {
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require('telescope').load_extension 'lazygit'
      end,
    },
  },
  'tpope/vim-fugitive',
  'rhysd/git-messenger.vim',
  'jiangmiao/auto-pairs',
  -- {
  --   'utilyre/barbecue.nvim',
  --   name = 'barbecue',
  --   version = '*',
  --   dependencies = {
  --     'SmiteshP/nvim-navic',
  --     'nvim-tree/nvim-web-devicons', -- optional dependency
  --   },
  --   opts = {
  --     -- configurations go here
  --   },
  -- },
  { 'karb94/neoscroll.nvim' },
  'mfussenegger/nvim-lint',
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
  },
  -- { 'akinsho/bufferline.nvim', version = '*', dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'yamatsum/nvim-cursorline' },
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    branch = 'regexp',
    config = function()
      require('venv-selector').setup {
        -- Your options go here
        -- name = "venv",
        -- auto_refresh = false
      }
    end,
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },
  {
    'echasnovski/mini.nvim',
    version = '*',
  },
  {
    'nvim-pack/nvim-spectre',
  },
  { 'echasnovski/mini.align', version = '*' },
  { 'lvimuser/lsp-inlayhints.nvim' },
  {
    'Badhi/nvim-treesitter-cpp-tools',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'folke/trouble.nvim',
    branch = 'main',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'folke/todo-comments.nvim',
    opts = {},
  },
  {
    'echasnovski/mini.animate',
  },
  {
    'hedyhli/outline.nvim',
  },
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
  },
  {
    'onsails/lspkind.nvim',
  },
  {
    'neanias/everforest-nvim',
  },
  {
    'p00f/clangd_extensions.nvim',
  },
  { 'diegoulloao/neofusion.nvim', priority = 1000, config = true, opts = ... },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'tris203/precognition.nvim',
    branch = 'inlay_hints',
  },
  {
    'rmagatti/auto-session',
  },
  {
    'danymat/neogen',
    config = true,
  },
  {
    'ggandor/leap.nvim',
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    main = 'render-markdown',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you use the mini.nvim suite
    ft = { 'markdown', 'Avante' },
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  {
    'sindrets/diffview.nvim',
  },
  {
    '3rd/image.nvim',
    config = function()
      -- ...
    end,
  },
  {
    'nvchad/ui',
    config = function()
      require 'nvchad'
    end,
  },
  { 'nvchad/volt' },
  {
    'nvchad/base46',
    lazy = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'alfaix/neotest-gtest',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'folke/snacks.nvim',
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    opts = {},
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'echasnovski/mini.pick', -- for file_selector provider mini.pick
      'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
  },
}
