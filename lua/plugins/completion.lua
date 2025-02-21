return {
  "hrsh7th/nvim-cmp",
  -- optional = true,
  dependencies = { "rcarriga/cmp-dap", lazy = true },
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "dap" })
    opts.filetype = opts.filetype or {}
    table.insert(opts.filetype, { "dap-repl", "dapui_watches", "dapui_hover" })
    opts.enabled = opts.enabled or require("cmp_dap").is_dap_buffer()
  end,
}
