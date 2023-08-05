local lsps = {
  'pyright',
  'clangd',
  'vtsls',
  'eslint',
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          autoReload = true,
        },
        checkOnSave = {
          command = 'clippy',
        },
      },
    },
  },
}

return lsps
