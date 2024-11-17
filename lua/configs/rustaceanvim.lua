M = {}

M.on_attach = function(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)

  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)

  vim.keymap.set("n", "<leader>ca", function()
    vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  end, { silent = true, buffer = bufnr })

  vim.keymap.set(
    "n",
    "gh", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
      vim.cmd.RustLsp { "hover", "actions" }
    end,
    { silent = true, buffer = bufnr }
  )
end

return M
