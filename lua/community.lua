-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.recipes.cache-colorscheme" },
  { import = "astrocommunity.colorscheme.cyberdream-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.neofusion-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim", enabled = true },
  { import = "astrocommunity.lsp.lspsaga-nvim" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.media.image-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.nvchad-ui", enabled = false },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.media.codesnap-nvim"}
  -- import/override with your plugins folder
}
