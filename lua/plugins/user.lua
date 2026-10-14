-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "alfaix/neotest-gtest",
      -- your other adapters here
    },
  },
  {
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      opts = {
        size = 10,
        open_mapping = [[<c-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = "/usr/bin/fish",
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "curved",
            background = "Normal",
          },
        },
      },
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>C", nil, desc = "AI/Claude Code" },
      { "<leader>Cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>Cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>Cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>CC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>Cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>Cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>Cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>Cs",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>Ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>Cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  {
    "lmilojevicc/herdr-splits.nvim",
    -- For local development, swap the repo line for `dir = '/path/to/herdr-splits'`
    -- (see "Local development" below).
    cond = vim.env.HERDR_ENV == "1",
    event = "VeryLazy",
    -- Optional: auto-sync the Herdr-side scripts when lazy updates this plugin.
    -- Requires `auto_sync_herdr = true` in setup() below to take effect.
    -- build = 'lua require("herdr-splits").sync_herdr()',
    config = function()
      require("herdr-splits").setup {
        -- Defaults shown. All fields optional.
        default_amount = 0.03, -- Herdr resize ratio
        neovim_amount = 3, -- Neovim resize cells
        at_edge = "wrap", -- 'wrap' | 'stop' | 'split' | function
        ignored_buftypes = { "nofile", "quickfix", "prompt", "help", "terminal" },
        ignored_filetypes = {
          "NvimTree",
          -- sidebars
          "neo-tree",
          "snacks_dashboard",
          "snacks_explorer",
          "snacks_picker",
          -- DB / REPL / data sidebars
          "dadbod-ui",
          "dbout",
          -- outlines / symbols
          "aerial",
          "Outline",
          -- diagnostics / quick lists
          "Trouble",
          "quickfix",
        },
        move_cursor_same_row = false,
        herdr_bin = nil, -- auto-detected from HERDR_BIN_PATH
        floating_zindex_max = 50, -- floats with zindex < this are treated as embedded sidebars
        ignore_previewwindows = false, -- opt-in: also treat previewwindow windows (e.g. .dbout) as sidebars
        -- auto_sync_herdr = true,      -- opt-in: sync Herdr-side scripts on update
        -- Managed keys — written to the generated herdr-splits.conf so the
        -- Herdr-side scripts agree. Pass Neovim notation (e.g. <M-Left>).
        nav_keys = { left = "<C-h>", down = "<C-j>", up = "<C-k>", right = "<C-l>" },
        resize_keys = { left = "<M-h>", down = "<M-j>", up = "<M-k>", right = "<M-l>" },
        unzoom_on_nav = true, -- auto-unzoom when navigating away from a zoomed pane
        nav_at_edge = "wrap", -- 'wrap' | 'stop' — Herdr pane-boundary wrap (distinct from at_edge)
      }
    end,
    keys = {
      { "<C-h>", function() require("herdr-splits").move_cursor_left() end, desc = "Navigate left" },
      { "<C-j>", function() require("herdr-splits").move_cursor_down() end, desc = "Navigate down" },
      { "<C-k>", function() require("herdr-splits").move_cursor_up() end, desc = "Navigate up" },
      { "<C-l>", function() require("herdr-splits").move_cursor_right() end, desc = "Navigate right" },
      { "<M-h>", function() require("herdr-splits").resize_left() end, desc = "Resize left" },
      { "<M-j>", function() require("herdr-splits").resize_down() end, desc = "Resize down" },
      { "<M-k>", function() require("herdr-splits").resize_up() end, desc = "Resize up" },
      { "<M-l>", function() require("herdr-splits").resize_right() end, desc = "Resize right" },
    },
  },
}
