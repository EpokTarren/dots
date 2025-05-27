vim.opt.errorbells = false

-- Line numbers
vim.opt.nuw = 5
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Word wrap
vim.opt.linebreak = true

-- Enable mouse
vim.opt.mouse = "a"

-- Share system and neovim clipboard
vim.opt.clipboard = "unnamedplus"

if vim.g.neovide then
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_opacity = 0.8
	vim.g.neovide_hide_mouse_when_typing = true
end

pcall(vim.cmd, "set title titlestring=%f")
