vim.g.mapleader = ","

-- Navigate buffers
vim.keymap.set("n", "<C-J>", ":bnext<CR>")
vim.keymap.set("n", "<C-K>", ":bprevious<CR>")
vim.keymap.set("n", "<C-W>", ":bdelete<CR>")

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste and delete without overwriting the cliboard
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- LSP action
vim.keymap.set({ "n", "v" }, "<leader>.", function()
	vim.lsp.buf.code_action()
end)
