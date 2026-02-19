return {
  "nvim-neotest/neotest",
  dependencies = {
    "alfaix/neotest-gtest",
  },
  opts = function(_, opts)
    if not opts.adapters then opts.adapters = {} end
    -- Add GTest adapter to existing adapters from community packs (Python, Rust)
    table.insert(opts.adapters, require("neotest-gtest").setup {})
  end,
}
