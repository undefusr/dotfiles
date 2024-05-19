vim.opt_local.expandtab = false
vim.opt.tabstop = 4

vim.keymap.set("n", "<space>td", function()
  require("dap-go").debug_test()
end, { buffer = 0 })
