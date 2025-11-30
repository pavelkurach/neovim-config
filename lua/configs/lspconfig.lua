require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "basedpyright", "clangd" }
vim.lsp.enable(servers)
