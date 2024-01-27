return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
      },
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      local lsp_utils = require("plugins.lsp.utils")
      lsp_utils.setup()

      mason_lspconfig.setup({
        ensure_installed = lsp_utils.lsp_servers,
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            on_attach = lsp_utils.on_attach,
            capabilities = lsp_utils.capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  enable = true,
                  globals = { "vim" },
                  disable = {
                    "missing-fields",
                    "no-unknown",
                  },
                },
                runtime = {
                  version = "LuaJIT",
                  path = vim.split(package.path, ";"),
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                  checkThirdParty = false,
                },
                completion = {
                  callSnippet = "Replace",
                  showWord = "Disable",
                },
              },
            },
          })
        end,
        ["gopls"] = function()
          lspconfig.gopls.setup({
            settings = {
              gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                  unusedparams = true,
                  shadow = true,
                },
                staticcheck = true,
              },
            },
          })
        end,
        ["rust_analyzer"] = function()
          require("rustaceanvim")
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      local lsp_utils = require("plugins.lsp.utils")
      require("mason").setup({
        pip = {
          upgrade_pip = true,
        },
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      local mr = require("mason-registry")
      local packages = lsp_utils.mason_packages
      local function ensure_installed()
        for _, package in ipairs(packages) do
          local p = mr.get_package(package)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
