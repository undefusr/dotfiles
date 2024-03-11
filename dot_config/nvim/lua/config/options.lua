local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.relativenumber = true
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

opt.magic = true
opt.virtualedit = "block"
opt.clipboard = "unnamedplus"
opt.swapfile = false

-- opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

opt.history = 2000
opt.ignorecase = true
opt.cursorline = true

opt.completeopt = "menu,menuone,noinsert"
opt.showmatch = true
opt.shortmess = "aoOTIcF"
opt.showtabline = 0
opt.showcmd = false

opt.cmdheight = 0
opt.laststatus = 3
opt.list = true

-- opt.listchars = "tab:»··,nbsp:+,trail:·,extends:→,precedes:←"

opt.foldlevelstart = 99
opt.foldmethod = "marker"

opt.textwidth = 100
opt.colorcolumn = "100"

if vim.fn.executable("rg") == 1 then
	opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end
