local set = vim.keymap.set

-- Basic movement keybinds, these make navigating splits easy for me
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-s>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")
set("n", "<leader>pv", vim.cmd.Vex)

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Normally these are not good mappings, but I have left/right on my thumb
-- cluster, so navigating tabs is quite easy this way.
set("n", "<left>", "gT")
set("n", "<right>", "gt")

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", vim.diagnostic.goto_next)
set("n", "[d", vim.diagnostic.goto_prev)

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-s>", "<C-W>+")
set("n", "<M-t>", "<C-W>-")
set("v", "<M-k>", ":m '<-2<CR>gv=gv")
set("v", "<M-j>", ":m '>+1<CR>gv=gv")

set("n", "<M-j>", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[m .+1<CR>==]]
  end
end)

set("n", "<M-k>", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[m .-2<CR>==]]
  end
end)

set("x", "<leader>p", [["_dP]])
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "N", "Nzzzv")
set("n", "n", "nzzzv")
set("n", "<leader>w", ":wa<cr>")
set("n", "<leader>q", ":wqa<cr>")
set("n", ";w", ":w<cr>")
set("n", ";q", ":q<cr>")
set("n", "<Esc>", ":nohls<cr>")

set("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

