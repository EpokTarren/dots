function mason()
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			-- Buffer local mappings.
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>gp", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		end,
	})

	require("mason").setup()
end

function lsp_config()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"rust_analyzer",
			"tsserver",
		},
	})

	local lspconfig = require("lspconfig")
	local get_servers = require("mason-lspconfig").get_installed_servers

	for _, server_name in ipairs(get_servers()) do
		lspconfig[server_name].setup({
			capabilities = lsp_capabilities,
		})
	end
end

function formatter()
	local util = require("formatter.util")

	require("formatter").setup({
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = { require("formatter.filetypes.lua").stylua },
			rust = { require("formatter.filetypes.rust").rustfmt },

			css = { require("formatter.filetypes.css").prettierd },
			html = { require("formatter.filetypes.html").prettierd },
			json = { require("formatter.filetypes.json").prettierd },
			yaml = { require("formatter.filetypes.yaml").prettierd },
			jsonc = { require("formatter.filetypes.json").prettierd },
			svelte = { require("formatter.filetypes.svelte").prettierd },
			markdown = { require("formatter.filetypes.markdown").prettierd },
			javascript = { require("formatter.filetypes.javascript").prettierd },
			typescript = { require("formatter.filetypes.typescript").prettierd },
			javascriptreact = { require("formatter.filetypes.javascript").prettierd },
			typescriptreact = { require("formatter.filetypes.typescript").prettierd },

			["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
		},
	})

	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		command = "FormatWriteLock",
	})
end

return {
	{ "williamboman/mason.nvim", config = mason },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = lsp_config,
	},
	{ "mhartington/formatter.nvim", config = formatter },
}
