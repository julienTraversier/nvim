
local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end
illuminate.configure()
