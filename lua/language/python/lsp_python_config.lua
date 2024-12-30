local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  --  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>', { buffer = bufnr, desc = '[C]ode [A]ction' })
  vim.keymap.set('n', '<leader>ch', ':Lspsaga incoming_calls<CR>', { buffer = bufnr, desc = '[C]all [H]ierarchy' })
  vim.keymap.set('n', '<leader>fu', ':Lspsaga finder<CR>', { buffer = bufnr, desc = '[F]ind [U]sage' })
  vim.keymap.set('n', '<leader>pd', ':Lspsaga peek_definition<CR>', { buffer = bufnr, desc = '[P]eek [D]efinition' })
  vim.keymap.set('n', '<leader>oo', ':Lspsaga outline<CR>', { buffer = bufnr, desc = '[O]pen [O]utline' })

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  --nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', { buffer = bufnr, desc = 'Hover Documentation' })
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
  --   vim.lsp.buf.format()
  -- end, { desc = 'Format current buffer with LSP' })
  -- if client.name == 'ruff_lsp' then
  --   -- Disable hover in favor of Pyright
  --   client.server_capabilities.hoverProvider = false
  -- end
end

-- require('lspconfig').ruff_lsp.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   inlay_hints = {enable = true},
--   codelens = {enable = true},
--   settings = {}
-- })

require('lspconfig').pyright.setup {
  on_attach = on_attach,
}
