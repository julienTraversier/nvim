local status_ok, leap = pcall(require, "leap")
if not status_ok then
  return
end

vim.keymap.set({'n', 'x', 'o'}, 'z', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'Z', '<Plug>(leap-backward-to)')
