return {
  cmd = { "ts_ls" },
  filetypes = { "ts", "tsx", "js", "jsx", "mts", "mjs"},
  settings = {
    init_options = {
      preferences = {
        includeInlayParameterNameHints = 'all'
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = false,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = false,
        includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayVariableTypeHints = false,
      },
    },
  },
}
