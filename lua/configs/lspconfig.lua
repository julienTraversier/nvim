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

require("mason").setup()
require("mason-lspconfig").setup()
local mason_lspconfig = require "mason-lspconfig"

local servers = {
  clangd = {},
  pyright = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      hint = {
        enable = true,
        arrayIndex = "Disable",
      },
    },
  },
}
vim.lsp.codelens.refresh()
vim.lsp.inlay_hint.enable(true)

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

-- EXAMPLE
local nvlsp = require "nvchad.configs.lspconfig"
-- lsps with default config
local capabilities = nvlsp.capabilities
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  ["rust_analyzer"] = function() end,
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      on_init = nvlsp.on_init,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
      cmd = (servers[server_name] or {}).cmd,
      inlay_hints = { enable = true },
      codelens = { enable = true },
    }
  end,
}

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
