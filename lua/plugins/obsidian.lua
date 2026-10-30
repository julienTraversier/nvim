return {
  "obsidian-nvim/obsidian.nvim",
  event = { "BufReadPre " .. vim.env.HOME .. "/obsidian-vault/*.md" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    legacy_commands = false,
    workspaces = {
      { name = "vault", path = vim.env.HOME .. "/obsidian-vault" },
    },
    ui = { enable = false },
    picker = { name = "snacks.pick" },
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
    daily_notes = { folder = "daily" },
  },
}
