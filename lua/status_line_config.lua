local cyberdream = require("lualine.themes.cyberdream")
local utils = require("core.utils")
local copilot_colors = {
    [""] = utils.get_hlgroup("Comment"),
    ["Normal"] = utils.get_hlgroup("Comment"),
    ["Warning"] = utils.get_hlgroup("DiagnosticError"),
    ["InProgress"] = utils.get_hlgroup("DiagnosticWarn"),
}
require("lualine").setup {
  theme = cyberdream,
    options = {
      component_separators = { left = " ", right = " " },
      section_separators = { left = " ", right = " " },
      theme = "auto",
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "alpha" } },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          icon = "",
          fmt = function(mode)
            return mode:lower()
          end,
        },
      },
      lualine_b = { { "branch", icon = "" } },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = "󰝶 ",
          },
        },
        { "filetype", icon_only = true,                 separator = "", padding = { left = 0, right = 0 } },
        { "filename", padding = { left = 0, right = 0 } },
        {
          function()
            local buffer_count = require("core.utils").get_buffer_count()

            return "+" .. buffer_count - 1 .. " "
          end,
          cond = function()
            return require("core.utils").get_buffer_count() > 1
          end,
          color = utils.get_hlgroup("Operator", nil),
          padding = { left = 0, right = 1 },
        },
      },
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = utils.get_hlgroup("String"),
        },
        { "diff" },
      },
      lualine_y = {
        {
          "progress",
        },
        {
          "location",
          color = utils.get_hlgroup("Boolean"),
        },
      },
      lualine_z = {
        {
          "datetime",
          style = "  %X",
        },
      },
    },
    extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
}
