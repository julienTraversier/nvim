-- Blink.cmp configuration with NvChad UI integration
return {
  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      -- Ensure opts structure exists
      opts = opts or {}

      -- Configure sources
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or {}

      -- Add DAP source for debugging
      table.insert(opts.sources.default, "dap")

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.dap = {
        name = "DAP",
        module = "blink.compat.source",
        score_offset = 100,
        opts = {
          filetype = { "dap-repl", "dapui_watches", "dapui_hover" },
        },
      }

      -- Configure appearance to work with NvChad UI
      opts.appearance = opts.appearance or {}
      opts.appearance.use_nvim_cmp_as_default = false
      opts.appearance.nerd_font_variant = "mono"

      -- Configure keymap
      opts.keymap = opts.keymap or {}
      opts.keymap.preset = "default"

      -- Additional ergonomic keymaps
      opts.keymap["<C-space>"] = { "show", "show_documentation", "hide_documentation" }
      opts.keymap["<C-e>"] = { "hide" }
      opts.keymap["<C-y>"] = { "select_and_accept" }
      opts.keymap["<C-k>"] = { "select_prev", "fallback" }
      opts.keymap["<C-j>"] = { "select_next", "fallback" }
      opts.keymap["<C-b>"] = { "scroll_documentation_up", "fallback" }
      opts.keymap["<C-f>"] = { "scroll_documentation_down", "fallback" }

      -- Configure completion menu
      opts.completion = opts.completion or {}
      opts.completion.menu = opts.completion.menu or {}
      opts.completion.menu.border = "rounded"
      opts.completion.menu.winhighlight =
        "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None"

      -- Configure documentation window
      opts.completion.documentation = opts.completion.documentation or {}
      opts.completion.documentation.auto_show = true
      opts.completion.documentation.auto_show_delay_ms = 200
      opts.completion.documentation.window = opts.completion.documentation.window or {}
      opts.completion.documentation.window.border = "rounded"
      opts.completion.documentation.window.winhighlight =
        "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None"

      -- Configure signature help
      opts.signature = opts.signature or {}
      opts.signature.enabled = true
      opts.signature.window = opts.signature.window or {}
      opts.signature.window.border = "rounded"

      return opts
    end,
  },

  -- DAP compatibility for blink.cmp
  {
    "rcarriga/cmp-dap",
    lazy = true,
    dependencies = { "Saghen/blink.compat" },
  },
}
