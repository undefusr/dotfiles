return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
      local group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

      ---@diagnostic disable-next-line: redundant-parameter
      require("nvim-treesitter").setup {
        ensure_installed = {
                "vimdoc", "go", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true
            },
            autopairs = { enable = true },
      }

      local syntax_on = {
	rust = true,
      }

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
          local bufnr = args.buf
          local ft = vim.bo[bufnr].filetype
          pcall(vim.treesitter.start)

          if syntax_on[ft] then
            vim.bo[bufnr].syntax = "on"
          end
        end,
      })
    end,
  },
}
