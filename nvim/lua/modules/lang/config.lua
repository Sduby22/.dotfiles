local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    ignore_install = { 'phpdoc' },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'org' },
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
    context_commentstring = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end

function config.rust_tools()
  require('rust-tools').setup({
    server = {
      on_attach = require('keymap.lsp_onattach'),
    },
  })
end

function config.clangd_extensions()
  require('clangd_extensions').setup({
    server = {
      on_attach = require('keymap.lsp_onattach'),
    },
  })
end

function config.null_ls()
  local null_ls = require('null-ls')
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.clang_format,
    },
    on_attach = require('keymap.lsp_onattach'),
  })
end

return config
