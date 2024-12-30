local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

keymap('', 'ù', '%', opts)

-- Insert --
-- Press jk fast to enter
keymap('i', 'jk', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

keymap('n', '<F4>', '<Cmd>ClangdSwitchSourceHeader<CR>', opts)
-- Terminal --
---- Better terminal navigation
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--
--harpoon
--w

keymap('n', '<leader>xx', ':Trouble diagnostics toggle<CR>', opts)

vim.keymap.set('n', '<A-left>', function()
  require('nvchad.tabufline').prev()
end, opts)

vim.keymap.set('n', '<A-right>', function()
  require('nvchad.tabufline').next()
end, opts)

vim.keymap.set('n', '<A-h>', function()
  require('nvchad.tabufline').prev()
end, opts)

vim.keymap.set('n', '<A-l>', function()
  require('nvchad.tabufline').next()
end, opts)

vim.keymap.set('n', '<leader>cc', function()
  require('nvchad.tabufline').closeAllBufs(false)
end, opts)

vim.keymap.set('n', '<A-c>', function()
  require('nvchad.tabufline').close_buffer()
end, opts)



vim.api.nvim_set_keymap('n', '<leader>tr', "<cmd>lua require('neotest').run.run()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>tf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>ts', "<cmd>Neotest summary<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>to', "<cmd>Neotest output-panel<CR>", opts)

-- vim.api.nvim_set_keymap('n', '<leader>tf', function()
--   require("neotest").run.run(vim.fn.expand("%"))
-- end, opts)
--
-- vim.api.nvim_set_keymap('n', '<leader>ts', ":Neotest summary<CR>", opts)
-- vim.api.nvim_set_keymap('n', '<leader>to', ":Neotest output-panel<CR>", opts)
