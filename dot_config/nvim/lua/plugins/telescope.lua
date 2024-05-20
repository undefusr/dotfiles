return {
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-smart-history.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "kkharji/sqlite.lua" },
    },
    config = function()
      local data = assert(vim.fn.stdpath "data") --[[@as string]]

      require("telescope").setup {
        extensions = {
          fzf = {},
          wrap_results = true,
          history = {
            path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
            limit = 100,
          },
          ["ui-select"] = {
            require("telescope.themes").get_ivy {
              -- even more opts
              shorten_path = true,
              sorting_strategy = "ascending",
              layout_strategy = "bottom_pane",
              previewer = true,
            },
          },
        },
      }

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "smart_history")
      pcall(require("telescope").load_extension, "ui-select")

      local builtin = require "telescope.builtin"

      vim.keymap.set("n", "<leader>fd", builtin.find_files)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)

      vim.keymap.set("n", "<leader>gw", builtin.grep_string)

      vim.keymap.set("n", "<leader>fa", function()
        ---@diagnostic disable-next-line: param-type-mismatch
        builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
      end)

      vim.keymap.set("n", "<leader>en", function()
        builtin.find_files { cwd = vim.fn.stdpath "config" }
      end)
    end,
  },
}
