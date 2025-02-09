-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  "mfussenegger/nvim-dap",
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    "rcarriga/nvim-dap-ui",
    -- Installs the debug adapters for you
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    -- Add your own debuggers here
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("mason-nvim-dap").setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,
      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},
      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        "delve",
      },
    }
    vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Debug: eval expression 2 time to step into it" })
    vim.keymap.set(
      "n",
      "<leader>df",
      function() dapui.float_element("stacks", { title = "stacks", height = 40, enter = true }) end,
      { desc = "Debug: pop up floating element" }
    )
    require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "launch file",
        cwd = "${workspaceFolder}",
        program = "${file}",
      },
    }

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "/home/jtraversier/Téléchargements/extension/debugAdapters/bin/OpenDebugAD7",
    }
    dap.configurations.c = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
      },
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        --program = "${workspaceFolder}/../build_x86/fiber-optic/Fiber_Optic",
        cwd = "${workspaceFolder}",
        args = {
          "--enable-pretty-printing",
        },
        stopAtEntry = false,
      },
    }
  end,
}
