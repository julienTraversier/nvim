-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  --  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", { buffer = bufnr, desc = "[C]ode [A]ction" })
  vim.keymap.set("n", "<leader>ch", ":Lspsaga incoming_calls<CR>", { buffer = bufnr, desc = "[C]all [H]ierarchy" })
  vim.keymap.set("n", "<leader>fu", ":Lspsaga finder<CR>", { buffer = bufnr, desc = "[F]ind [U]sage" })
  vim.keymap.set("n", "<leader>pd", ":Lspsaga peek_definition<CR>", { buffer = bufnr, desc = "[P]eek [D]efinition" })
  vim.keymap.set("n", "<leader>oo", ":Lspsaga outline<CR>", { buffer = bufnr, desc = "[O]pen [O]utline" })

  nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
  nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  -- See `:help K` for why this keymap
  --nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", { buffer = bufnr, desc = "Hover Documentation" })
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
end

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "clangd", "pyright", "lua_ls" }
local nvlsp = require "nvchad.configs.lspconfig"
-- lsps with default config
local capabilities = nvlsp.capabilities
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
    inlay_hints = { enable = true },
    codelens = { enable = true },
  }
end
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

require("lspsaga").setup {
  finder = {
    keys = {
      shuttle = "<Tab>",
      toggle_or_open = "e",
    },
  },
  callhierarchy = {
    keys = {
      shuttle = "<Tab>",
    },
  },
  outline = {
    layout = "float",
  },
}
