return {
	"EpokTarren/themes.vim",
	config = function()
		vim.opt.termguicolors = true
		vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR = 1")

		vim.g.theme_style = "Imouto?"
		pcall(vim.cmd, "runtime theme.vim")
		vim.cmd("colorscheme tarren")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.g.airline_theme = "tarren"
	end,
}
