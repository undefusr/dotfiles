return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  opts = function()
    return {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        path_display = { "truncate" },
        shorten_path = true,
        prompt_prefix = " λ ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "bottom_pane",
        layout_config = {
          height = 10,
        },
        file_ignore_patterns = { "^vendor/" },
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },

        ["ui-select"] = {
          require("telescope.themes").get_ivy({
            -- even more opts
            shorten_path = true,
            sorting_strategy = "ascending",
            layout_strategy = "bottom_pane",
            previewer = true,
            layout_config = {
              height = 6,
            },
          }),
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzy_native")
    telescope.load_extension("ui-select")
    telescope.load_extension("dotfiles")
    telescope.load_extension("app")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>tt", "<cmd>Telescope <cr>", { desc = "Open telescope" })
    keymap.set("n", "<leader>tp", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>tr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>ts", "<cmd>Telescope document_symbols<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>tc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set(
      "n",
      "<leader>tw",
      "<cmd>Telescope lsp_workspace_symbols ignore_symbols<cr>",
      { desc = "Find string under cursor in cwd" }
    )
    keymap.set(
      "n",
      "<leader>td",
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      { desc = "Find string under cursor in cwd" }
    )
    keymap.set(
      "n",
      "<leader>tD",
      "<cmd>Telescope lsp_workspace_diagnostic<cr>",
      { desc = "Find string under cursor in cwd" }
    )
  end,
}
