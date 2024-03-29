return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "nvim-tree/nvim-web-devicons",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      --     {
      --       "zbirenbaum/copilot-cmp",
      --       dependencies = "copilot.lua",
      --       opts = {},
      --       config = function(_, opts)
      --         local copilot_cmp = require("copilot_cmp")
      --         copilot_cmp.setup(opts)
      --       end,
      --     },
    },
    opts = function()
      local cmp = require("cmp")
      local lsp_kinds = require("plugins.lsp.utils").lsp_kinds
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      --     local has_words_before = function()
      --       if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
      --         return false
      --       end
      --       local line, col = vim.F.unpack_len(vim.api.nvim_win_get_cursor(0))
      --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      --     end

      return {
        completion = {
          keyword_length = 1,
          docs_initially_visible = false,
        },
        experimental = {
          ghost_text = true,
          -- ghost_text = {
          --   hl_group = "LspCodeLens",
          -- },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- formatting = {
        --   format = function(entry, vim_item)
        --     if vim.tbl_contains({ "path" }, entry.source.name) then
        --       local icon, hl_group =
        --           require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
        --       if icon then
        --         vim_item.kind = icon
        --         vim_item.kind_hl_group = hl_group
        --         return vim_item
        --       end
        --     end
        --     vim_item.kind = (lsp_kinds[vim_item.kind] or "") .. " " .. vim_item.kind
        --     vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
        --
        --     return vim_item
        --   end,
        -- },
        view = {
          docs = {
            auto_open = true,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            select = true,
            -- behavior = cmp.ConfirmBehavior.Insert,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
              -- elseif has_words_before() then
              --cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lsp_signature_help" },
          -- { name = "copilot" },
          -- { name = "path" },
          -- { name = "buffer" },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      local types = require("cmp.types")
      cmp.setup(opts)
      cmp.setup.filetype({ "go" }, {
        preselect = types.cmp.PreselectMode.None,
        sorting = {
          comparators = {
            cmp.config.compare.length,
            cmp.config.compare.locality,
            cmp.config.compare.sort_text,
          },
        },
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
