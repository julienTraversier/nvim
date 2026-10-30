return {
  "NvChad/ui",
  opts = {
    ui = {
      statusline = {
        enabled = true,
        theme = "default",
        separator_style = "default",
        order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "clock", "lsp", "cwd", "cursor" },
        modules = {
          clock = function() return "  " .. os.date "%H:%M " end,
        },
      },
      cmp = {
        icons_left = false,
        lspkind_text = true,
        style = "atom_colored",
        format_colors = { tailwind = false, icon = "󱓻" },
      },
    },
  },
}
