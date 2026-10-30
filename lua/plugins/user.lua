---@type LazySpec
return {
  { "max397574/better-escape.nvim", enabled = false },

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
      { "<leader>Ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>Cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },

  {
    "lmilojevicc/herdr-splits.nvim",
    cond = vim.env.HERDR_ENV == "1",
    event = "VeryLazy",
    config = function()
      require("herdr-splits").setup {
        default_amount = 0.03,
        neovim_amount = 3,
        at_edge = "wrap",
        ignored_buftypes = { "nofile", "quickfix", "prompt", "help", "terminal" },
        ignored_filetypes = {
          "NvimTree",
          "neo-tree",
          "snacks_dashboard",
          "snacks_explorer",
          "snacks_picker",
          "dadbod-ui",
          "dbout",
          "aerial",
          "Outline",
          "Trouble",
          "quickfix",
        },
        move_cursor_same_row = false,
        floating_zindex_max = 50,
        ignore_previewwindows = false,
        nav_keys = { left = "<C-h>", down = "<C-j>", up = "<C-k>", right = "<C-l>" },
        resize_keys = { left = "<M-h>", down = "<M-j>", up = "<M-k>", right = "<M-l>" },
        unzoom_on_nav = true,
        nav_at_edge = "wrap",
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
