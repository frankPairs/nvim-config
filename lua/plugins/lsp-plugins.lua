return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("astro")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("eslint")
			vim.lsp.enable("gopls")

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "astro", "ts_ls", "eslint" },
			})
		end,
	},
}
