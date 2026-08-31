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
      vim.lsp.enable("eslint")
      vim.lsp.enable("gopls")

      vim.lsp.config('ts_ls', {
        cmd = { 'typescript-language-server', '--stdio' },
        filetypes = { 'typescript', 'typescriptreact' },
        root_dir = vim.fs.root(0, { 'package.json', '.git' }),
        on_attach = on_attach,
        capabilities = capabilities,
      })

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
        ensure_installed = { "lua_ls", "rust_analyzer", "astro", "eslint", "ts_ls", "gopls" },
      })
    end,
  },
}
