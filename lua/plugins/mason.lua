---@type LazySpec
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "debugpy",
      "tree-sitter-cli",
    },
  },
}
