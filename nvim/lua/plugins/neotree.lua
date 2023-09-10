return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<C-t>", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
		{ "<leader>t", "<cmd>Neotree current<cr>", desc = "Neotree netrw" },
		{ "<leader>n", "<cmd>Neotree focus<cr>", desc = "Neotree focus" },
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}
