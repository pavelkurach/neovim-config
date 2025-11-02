vim.lsp.config("basedpyright", {
  filetypes = { "python" },
  settings = {
    basedpyright = {
      disableOrganizeImports = true, -- Using Ruff
      analysis = {
        typeCheckingMode = "strict",
      },
    },
  },
})
