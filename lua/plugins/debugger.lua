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
    vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Debug: eval expression 2 time to step into it" })
    vim.keymap.set(
      "n",
      "<leader>df",
      function() dapui.float_element("stacks", { title = "stacks", height = 40, enter = true }) end,
      { desc = "Debug: pop up floating element" }
    )
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
    require("dap-python").setup "~/.virtualenvs/debugpy/bin/python3.11"
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
    vim.g.last_entered_path = nil
    dap.configurations.c = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        -- program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        program = function()
          -- Default to current working directory or last entered path
          local default_path = vim.g.last_entered_path or (vim.fn.getcwd() .. "/")

          -- Get user input with the default path
          local path = vim.fn.input("Path to executable: ", default_path, "file")

          -- Save the entered path for future use
          if path and path ~= "" then
            -- Store just the directory part for future use
            vim.g.last_entered_path = vim.fn.fnamemodify(path, ":h") .. "/"
          end

          return path
        end,
        cwd = "${workspaceFolder}",
        args = function()
          local input = vim.fn.input "Arguments: "
          return vim.split(input, " ")
        end,
        stopAtEntry = false,
      },
    }
    dap.configurations.cpp = dap.configurations.c
    -- dap.configurations.cpp = {
    --   {
    --     name = "Launch file",
    --     type = "cppdbg",
    --     request = "launch",
    --     program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
    --     --program = "${workspaceFolder}/../build_x86/fiber-optic/Fiber_Optic",
    --     cwd = "${workspaceFolder}",
    --     -- args = {
    --     --   "--enable-pretty-printing",
    --     -- },
    --     args = function()
    --       local input = vim.fn.input "Arguments: "
    --       return vim.split(input, " ")
    --     end,
    --     stopAtEntry = false,
    --   },
    -- }
  end,
}
