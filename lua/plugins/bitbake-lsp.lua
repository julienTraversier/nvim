-- Register bitbake language server with lspconfig
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local lspconfig = require "lspconfig"
    local configs = require "lspconfig.configs"

    -- Register bitbake server if not already registered
    if not configs.bitbake then
      configs.bitbake = {
        default_config = {
          cmd = { "language-server-bitbake", "--stdio" },
          filetypes = { "bitbake" },
          single_file_support = true,
        },
      }
    end

    return opts
  end,
}
