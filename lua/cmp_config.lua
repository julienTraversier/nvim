-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load()

vim.api.nvim_set_hl(0, 'CmpItemKindCody', { fg = 'Red' })
vim.api.nvim_set_hl(0, 'CmpItemKindSupermaven', { fg = '#6CC644' })
local options = {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },
  -- completion = {
  --   completeopt = 'menu,menuone,noinsert',
  -- },
  -- formatting = {
  --   --   --format = function(entry, vim_item)
  --   --   --  vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
  --   --   --  return vim_item
  --   --   --end
  --   --   --format = function(_, vim_item)
  --   --   --  vim_item.menu = ""
  --   --   --  vim_item.kind = ""
  --   --   --  return vim_item
  --   --   --end,
  --   format = require('lspkind').cmp_format {
  --     --     -- before = function(entry, vim_item)
  --     --     --   --vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
  --     --     --   vim_item.menu = ""
  --     --     --   --vim_item.kind = ""
  --     --     --   return vim_item
  --     --     -- end,
  --     --     -- mode = "symbol",
  --     --     -- maxwidth = 70,
  --     --     -- ellipsis_char = '...',
  --     symbol_map = { Supermaven = '' },
  --   },
  -- },
  mapping = cmp.mapping.preset.insert {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<enter>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  -- sorting = {
  --   priority_weight = 1.0,
  --   comparators = {
  --     cmp.config.compare.offset,
  --     cmp.config.compare.exact,
  --     cmp.config.compare.recently_used,
  --     cmp.config.compare.score,
  --     cmp.config.compare.kind,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --     require('cmp-under-comparator').under,
  --   },
  -- },
  sources = {
    -- {name ="cody", priority=10},
    { name = 'supermaven', priority = 10 },
    { name = 'nvim_lsp', priority = 8 },
    { name = 'luasnip', priority = 7 },
    -- { name = 'codeium' },
    { name = 'buffer', priority = 1 },
    { name = 'path' },
  },
}
options = vim.tbl_deep_extend("force", options, require "nvchad.cmp")
require("cmp").setup(options)
