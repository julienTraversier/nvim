return {
  "NvChad/ui",
  opts = {
    ui = {
      statusline = {
        enabled = true,
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "default",
        order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "clock", "lsp", "cwd", "cursor" },
        modules = {
          clock = function() return "  " .. os.date "%H:%M " end,
        },
      },
      cmp = {
        icons_left = false, -- only for non-atom styles!
        lspkind_text = true,
        style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
        format_colors = {
          tailwind = false, -- will work for css lsp too
          icon = "󱓻",
        },
      },
    },
  },
}
