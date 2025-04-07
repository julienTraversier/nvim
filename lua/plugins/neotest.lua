return {
  "nvim-neotest/neotest",

  config = function(_, opts)
    require("neotest").setup {
      adapters = {
        require("neotest-gtest").setup { opts },
      },
    }
  end,
}
