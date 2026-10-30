local text_sources = { "lsp", "path", "snippets", "buffer", "dictionary", "spell" }

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        markdown_spell = {
          {
            event = "FileType",
            pattern = { "markdown", "text", "gitcommit" },
            desc = "Enable spell checking (en + fr)",
            callback = function()
              vim.opt_local.spell = true
              vim.opt_local.spelllang = "en,fr"
            end,
          },
        },
      },
    },
  },

  {
    "Saghen/blink.cmp",
    optional = true,
    dependencies = {
      { "Kaiser-Yang/blink-cmp-dictionary", dependencies = { "nvim-lua/plenary.nvim" } },
      "ribru17/blink-cmp-spell",
    },
    opts = {
      sources = {
        per_filetype = {
          markdown = text_sources,
          text = text_sources,
          gitcommit = text_sources,
        },
        providers = {
          dictionary = {
            name = "Dict",
            module = "blink-cmp-dictionary",
            min_keyword_length = 3,
            score_offset = -3,
            opts = {
              dictionary_files = { "/usr/share/dict/american-english", "/usr/share/dict/french" },
            },
          },
          spell = {
            name = "Spell",
            module = "blink-cmp-spell",
            score_offset = -1,
          },
        },
      },
    },
  },
}
