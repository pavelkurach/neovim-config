M = {}

M.config = function()
  local dap = require "dap"
  local codelldb = require("mason-registry").get_package("codelldb"):get_install_path() .. "/codelldb"

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = codelldb,
      args = { "--port", "${port}" },
    },
  }

  dap.configurations.c = {
    {
      name = "Debug an Executable",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end

return M
