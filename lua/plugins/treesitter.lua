return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensured_installed = { "lua", "rust", "go" },
			highlight = { enabled = true },
			indent = { enabled = true },
		})
	end,
}
