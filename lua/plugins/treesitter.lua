return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.config")

    config.setup({
      build = "TSUpdate",
      auto_install = true,
      ensured_installed = { "lua", "rust", "go", "javascript", "typescript", "tsx" },
      highlight = { enabled = true },
      indent = { enabled = true },
    })
  end,
}
