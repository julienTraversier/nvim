
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local status,fzf = pcall(require('telescope').load_extension, 'fzf')

if not status then
  return
end

require('telescope').setup {
  defaults = {
    path_display={"smart"}
  }
  --   layout_strategy = 'flex',
  --   layout_config ={
  --     horizontal = {
  --       width = 0.8,
  --       height = 0.8,
  --       preview_width = 0.6,
  --     },
  --     vertical = {
  --       width = 0.8,
  --       height = 0.8,
  --       preview_height = 0.6,
  --       preview_cutoff = 120
  --     }
  --   },
  --   path_display={"tail"},
  --   wrap_results = true,
  --   mappings = {
  --     i = {
  --       ['<C-u>'] = false,
  --       ['<C-d>'] = false,
  --     },
  --   },
  -- },
  -- pickers = {
  --   find_files = {
  --     hidden = true
  --   },
  -- }
}

-- Enable telescope fzf native, if installed

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep({
      search_dirs = { git_root },
    })
  end
end
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', require('telescope').extensions.live_grep_args.live_grep_args, { desc = '[S]earch by [G]rep with args' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Search in File' })
vim.keymap.set('n', '<leader>ft', function()
 require("nvchad.themes").open { style = "flat" }
end, { desc = 'Search in File' }  )

