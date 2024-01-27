return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.buf,
        null_ls.builtins.diagnostics.protoc_gen_lint,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser
      },
    })
  end
}
