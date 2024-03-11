local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local present, lazy = pcall(require, "lazy")
if present then
  lazy.setup("plugins", {
    ui = {
      size = { width = 0.8, height = 0.8 },
      border = "rounded",
    },
    install = { colorscheme = { "catppuccin-frappe", "tokyonight" } },
    checker = { enabled = true, notify = false },
    debug = false,
    performance = {
      rtp = {
        disabled_plugins = {
          "2html_plugin",
          "getscript",
          "getscriptPlugin",
          "gzip",
          "logipat",
          "netrw",
          "netrwPlugin",
          "netrwSettings",
          "netrwFileHandlers",
          "matchit",
          -- "matchparen",
          "tar",
          "tarPlugin",
          "rrhelper",
          "spellfile_plugin",
          "vimball",
          "vimballPlugin",
          "zip",
          "zipPlugin",
        },
      },
    },
  })
end
