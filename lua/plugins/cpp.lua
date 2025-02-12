return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = function(_, opts)
      opts.config = require("astrocore").extend_tbl(opts.config, {
        clangd = {
          cmd = {
            "clangd",
            "--all-scopes-completion",
            "--background-index",
            "--clang-tidy",
            "--compile_args_from=filesystem", -- lsp-> does not come from compie_commands.json
            "--completion-parse=always",
            "--completion-style=detailed",
            "--debug-origin",
            "--enable-config=true", -- clangd 11+ supports reading from .clangd configuration file
            "--function-arg-placeholders",
            "--header-insertion=iwyu",
            "--pch-storage=memory", -- could also be disk
            "--log=error",
            -- "--query-driver=/opt/viavi/sdk/**", --ALE-23.3.aarch64/sysroots/x86_64-viavi-linux/usr/bin/aarch64-poky-linux/aarch64-poky-linux-g++"
          },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          -- root_dir = function(fname)
          --   return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
          -- end,
          single_file_support = true,
          capabilities = {
            offsetEncoding = "utf-16",
          },
        },
      })
      -- require("astrocore").list_insert_unique(opts.servers, { "clangd" })
    end,
  },
}
