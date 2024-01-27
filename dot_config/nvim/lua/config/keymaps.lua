local keymap = vim.keymap

if vim.lsp.inlay_hint then
  keymap.set("n", "<leader>uh", function()
    vim.lsp.inlay_hint(0, nil)
  end, { desc = "Toggle Inlay Hints" })
end

keymap.set("i", "jj", "<ESC>", { desc = "" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "" })
keymap.set("n", "<A-j>", ":m .+1<CR>==.", { desc = "" })
keymap.set("n", "<A-k>", ":m .-2<CR>==.", { desc = "" })
keymap.set("i", "<A-j>", ":<ESC>m .+1<CR>==gi.", { desc = "" })
keymap.set("i", "<A-k>", ":<ESC>m .-2<CR>==gi.", { desc = "" })
keymap.set("n", "<A-j>", ":m '>+1<CR>gv=gv.", { desc = "" })
keymap.set("i", "<A-k>", ":m '>-2<CR>gv=gv.", { desc = "" })
keymap.set("n", ";;", "$a;<ESC>", { desc = "" })
keymap.set("i", ";;", "<ESC>$a;<ESC>", { desc = "" })
keymap.set("i", "-s", "{}", { desc = "" })
keymap.set("i", "-?", "{:?}", { desc = "" })
keymap.set("n", ";q", ":q<CR>", { desc = "", silent = true, remap = true })
keymap.set("n", ";w", ":wa<CR>", { desc = "", silent = true, nowait = true, expr = false, remap = true })
keymap.set("n", "<Leader>bp", "<cmd>bp<cr>", { desc = "" })
keymap.set("n", "<Leader>bn", "<cmd>bn<cr>", { desc = "" })
keymap.set("n", "<Leader>bd", "<cmd>Bdelete<cr>", { desc = "" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "" })

-- -- window management
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
--
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
