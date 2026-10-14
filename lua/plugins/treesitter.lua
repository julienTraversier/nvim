-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true, -- enable/disable treesitter based highlighting
      indent = true, -- enable/disable treesitter based indentation
      auto_install = true, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
      },
    },
    autocmds = {
      -- WARN: tree-sitter-xml external scanner crashes nvim (invalid free in
      -- _array__delete during incremental parse). Disable TS for XML filetypes
      -- and fall back to Vim's regex syntax until the grammar is fixed upstream.
      disable_xml_treesitter = {
        {
          event = "FileType",
          pattern = { "xml", "svg", "xsd", "dtd" },
          desc = "Disable tree-sitter for XML (scanner crash in tree-sitter-xml)",
          callback = function(args)
            vim.treesitter.stop(args.buf)
          end,
        },
      },
    },
  },
}
