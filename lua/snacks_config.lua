require('snacks').setup = {
  lazygit = {},
}

vim.keymap.set('n', '<leader>GG', function()
  require('snacks').lazygit.open()
end)
