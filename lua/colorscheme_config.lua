--vim.cmd.colorscheme 'catppuccin-mocha'
require("neofusion").setup()
require("everforest").setup({})
require("cyberdream").setup()
vim.o.background = "dark"
vim.cmd([[ colorscheme cyberdream ]])

require("catppuccin").setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        noice = true,
        telescope = {
            enabled = true,
        },
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        barbecue = {
            dim_dirname = true,
            bold_basename = true,
            dim_context = true,
            alt_background = true,
        }
    }
})
