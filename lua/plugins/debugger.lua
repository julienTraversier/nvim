return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

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

    require("dap-python").setup(vim.fn.expand "~/.virtualenvs/debugpy/bin/python")

    local last_dir
    dap.configurations.c = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          local path = vim.fn.input("Path to executable: ", last_dir or (vim.fn.getcwd() .. "/"), "file")
          if path ~= "" then last_dir = vim.fn.fnamemodify(path, ":h") .. "/" end
          return path
        end,
        cwd = "${workspaceFolder}",
        args = function() return vim.split(vim.fn.input "Arguments: ", " ") end,
        stopOnEntry = false,
      },
    }
    dap.configurations.cpp = dap.configurations.c
  end,
}
