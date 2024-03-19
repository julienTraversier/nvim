local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true }
--vim.keymap.set('n','K',":RustLsp hover actions<CR>" ,{buffer = bufnr, desc = 'Hover Documentation'})
vim.api.nvim_set_keymap('n','K',":RustLsp hover actions<CR>" , {noremap = true, silent = true, desc="Hover Documentation"})
vim.api.nvim_set_keymap('n','<leader>ca',":RustLsp codeAction<CR>" ,                {noremap = true,silent = true, desc = 'Code actions'})
vim.api.nvim_set_keymap('n','<leader>ch',":Lspsaga incoming_calls<CR>" ,            {noremap = true,silent = true, desc = '[C]all [H]ierarchy'})
vim.api.nvim_set_keymap('n','<leader>fu',":Lspsaga finder<CR>" ,                    {noremap = true,silent = true, desc = '[F]ind [U]sage'})
vim.api.nvim_set_keymap('n','<leader>pd',":Lspsaga peek_definition<CR>" ,           {noremap = true,silent = true, desc = '[P]eek [D]efinition'})
vim.api.nvim_set_keymap('n','<leader>oo',":Lspsaga outline<CR>" ,                   {noremap = true,silent = true, desc = '[O]pen [O]utline'})
--vim.api.nvim_set_keymap('n','<leader>rn',vim.lsp.buf.rename ,                       {noremap = true,silent = true, desc = '[R]e[n]ame'})
vim.api.nvim_set_keymap('n','gd',":lua require('telescope.builtin').lsp_definitions()<CR>" ,     {noremap = true,silent = true, desc = '[G]oto [D]efinition'})
vim.api.nvim_set_keymap('n','gr',":lua require('telescope.builtin').lsp_references()<CR>" ,      {noremap = true,silent = true, desc = '[G]oto [R]eferences'})
vim.api.nvim_set_keymap('n','gD',":lua require('telescope.builtin').lsp_type_definitions()<CR>" ,{noremap = true,silent = true, desc = '[D]ocument [S]ymbols'})


