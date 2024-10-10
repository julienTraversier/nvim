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
vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format { async = true, lsp_format = 'fallback', range = range }
end, { range = true })

map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sG', require('telescope').extensions.live_grep_args.live_grep_args, { desc = '[S]earch by [G]rep with args' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
map('n', '<leader>ff', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Search in File' })
