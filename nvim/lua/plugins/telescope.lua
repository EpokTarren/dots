return {

	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<C-p>", "<cmd>Telescope git_files<cr>", "n" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", "n" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", "n" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", "n" },
	},
}
