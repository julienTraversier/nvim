return {
  {
    "Saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        default = { "dap" },
        providers = {
          dap = {
            name = "DAP",
            module = "blink.compat.source",
            score_offset = 100,
            opts = { filetype = { "dap-repl", "dapui_watches", "dapui_hover" } },
          },
        },
      },
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-y>"] = { "select_and_accept" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      completion = {
        trigger = { prefetch_on_insert = false },
        menu = { border = "rounded" },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
      },
      signature = { enabled = true, window = { border = "rounded" } },
    },
  },

  {
    "rcarriga/cmp-dap",
    lazy = true,
    dependencies = { "Saghen/blink.compat" },
  },
}
