package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/6.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"
require("image").setup()
