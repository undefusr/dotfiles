local opt = vim.opt

----- Interesting Options -----

-- You have to turn this one on :)
opt.inccommand = "split"

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

----- Personal Preferences -----
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Don't have `o` add a comment
opt.formatoptions:remove "o"

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.breakindent = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true

opt.lazyredraw = true

opt.colorcolumn = "100"

opt.cmdheight = 0
opt.laststatus = 3

opt.mouse = "a"

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

opt.magic = true
opt.virtualedit = "block"
opt.clipboard = "unnamedplus"

if vim.fn.executable "rg" == 1 then
  opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end
