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
    },
  },
}
