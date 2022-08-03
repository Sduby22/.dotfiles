-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

-- config server in this function
function config.nvim_lsp() 
  local lspconfig = require('lspconfig')
  local on_attach = require('keymap.lsp_onattach')
  local lsps = { 'pyright' }
  for _, v in ipairs(lsps) do
    lspconfig[v].setup{ on_attach = on_attach }
  end
end

function config.nvim_cmp()
  local cmp = require('cmp')
  local snippy = require("snippy")

  cmp.setup({
    snippet = {
      expand = function(args)
        snippy.expand_snippet(args.body) -- For `snippy` users.
      end
    },
    mapping = {
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = false })
    },
    sources = {
      {name = 'snippy'}, {name = 'nvim_lsp'}, {name = 'cmdline'},
      {name = 'buffer'}, {name = 'path'}, {name = 'nvim_lsp_signature_help'},
      {name = 'nvim_lsp_document_symbol'}, {name = 'hrsh7th/cmp-cmdline'},
      {name = 'copilot'},
    },
    -- preselect = cmp.PreselectMode.Item,
    formatting = {
      format = function (entry, vim_item)
        if entry.source.name == "copilot" then
          vim_item.kind = "[] Copilot"
          vim_item.kind_hl_group = "CmpItemKindCopilot"
        end
        return vim_item
        -- return lspkind.cmp_format({ with_text = false, maxwidth = 50 })(entry, vim_item)
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  })
  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'path' }, { name = 'cmdline' }
    }
  })

end

function config.snippy()
  local snippy = require("snippy")
  snippy.setup({
      mappings = {
          is = {["<Tab>"] = "expand_or_advance", ["<S-Tab>"] = "previous"},
          nx = {["<leader>x"] = "cut_text"}
      }
  })
end

function config.lua_snip()
  local ls = require('luasnip')
  local types = require('luasnip.util.types')
  ls.config.set_config({
    history = true,
    enable_autosnippets = true,
    updateevents = 'TextChanged,TextChangedI',
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { '<- choiceNode', 'Comment' } },
        },
      },
    },
  })
  require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

return config
