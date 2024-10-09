require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", {})
map("n", "<C-Down>", ":resize -2<CR>", {})
map("n", "<C-Left>", ":vertical resize -2<CR>", {})
map("n", "<C-Right>", ":vertical resize +2<CR>", {})

map("n", "<leader>e", ":NvimTreeToggle<CR>", {desc = "Toggle tree"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
