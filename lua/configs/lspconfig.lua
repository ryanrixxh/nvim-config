require("nvchad.configs.lspconfig").defaults()

vim.lsp.config('*', {
  opts = {
    inlay_hints = { enabled = true },
  },
})

vim.lsp.inlay_hint.enable(true)

vim.lsp.enable("rust-analyzer")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")

-- read :h vim.lsp.config for changing options of lsp servers 
