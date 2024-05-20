return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    theme = "neo",
  },
  config = function(_, opts)
    require("solarized").setup(opts)
    local time = os.date "*t"
    if time.hour < 8 or time.hour > 18 then
      vim.o.background = "dark"
    else
      vim.o.background = "light"
    end
    -- vim.o.background = "dark"
    vim.cmd [[colorscheme default]]
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
