local status_ok, barbar = pcall(require, "barbar")
if not status_ok then
  return
end

vim.g.barbar_auto_setup = false
barbar.setup {
  -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
  animation = true,
  clickable = true,
  -- insert_at_start = true,
  -- …etc.
}
