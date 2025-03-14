local null_ls = require "null-ls"

local opts = {
  sources = {
    -- python
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.mypy,

    -- javascript/typescript
    null_ls.builtins.formatting.prettierd,

    -- assembly
    null_ls.builtins.formatting.asmfmt.with {
      filetypes = { "asm", "s", "S" },
    },
  },
}
return opts
