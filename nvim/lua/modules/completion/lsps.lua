local lsps = {
  'pyright',
  'clangd',
  'vtsls',
  'eslint',
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = 'clippy',
        },
        procMacro = { enable = true },
      },
    },
  },
}

return lsps
