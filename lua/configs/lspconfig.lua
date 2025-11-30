require("nvchad.configs.lspconfig").defaults()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local function opts(desc)
      return { buffer = args.buf, desc = "LSP " .. desc }
    end

    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts "Go to type definition")
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts "Hover information")
  end,
})

local servers = { "html", "cssls", "basedpyright", "clangd" }
vim.lsp.enable(servers)
