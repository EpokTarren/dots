return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	keys = {
		{ "<leader>re", "<cmd>Refactor extract<cr>", "x", desc = "extract" },
		{ "<leader>rf", "<cmd>Refactor extract_to_file<cr>", "x", desc = "extract_to_file" },
		{ "<leader>rv", "<cmd>Refactor extract_var<cr>", "x", desc = "extract var" },
		{ "<leader>ri", "<cmd>Refactor inline_var<cr>", { "n", "x" }, desc = "inline var" },
		{ "<leader>rI", "<cmd>Refactor inline_func<cr>", "n", desc = "inline func" },
		{ "<leader>rb", "<cmd>Refactor extract_block<cr>", "n", desc = "extract block" },
		{ "<leader>rbf", "<cmd>Refactor extract_block_to_file<cr>", "n", desc = "extract block to file" },
	},
	config = function()
		require("refactoring").setup()
	end,
}
