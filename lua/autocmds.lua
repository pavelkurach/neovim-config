require "nvchad.autocmds"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local function opts(desc)
      return { buffer = args.buf, desc = "LSP " .. desc }
    end

    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts "Go to type definition")
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts "Hover information")

    vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "NONE", fg = "#666666" })
  end,
})
