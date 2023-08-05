-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}
local lsps = require('modules.completion.lsps')

-- config server in this function
function config.nvim_lsp()
  local lspconfig = require('lspconfig')
  local on_attach = require('keymap.lsp_onattach')
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local default = {
    on_attach = on_attach,
  }

  for k, v in pairs(lsps) do
    if type(k) == 'string' then
      lspconfig[k].setup(vim.tbl_deep_extend('force', default, v))
    else
      lspconfig[v].setup(default)
    end
  end
end

function config.nvim_cmp()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
      return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match('^%s*$') == nil
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<C-l>'] = cmp.mapping.confirm({ select = false }),
      -- ["<Tab>"] = vim.schedule_wrap(function(fallback)
      --   if cmp.visible() and has_words_before() then
      --     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      --   else
      --     fallback()
      --   end
      -- end),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = {
      { name = 'luasnip' },
      { name = 'luasnip_choice' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'async-path' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp_document_symbol' },
    },
    -- preselect = cmp.PreselectMode.Item,
  })
  vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'async-path' },
      { name = 'cmdline' },
    },
  })
end

function config.lua_snip()
  local ls = require('luasnip')
  -- local types = require('luasnip.util.types')
  -- ls.config.set_config({
  --   history = true,
  --   enable_autosnippets = true,
  --   updateevents = 'TextChanged,TextChangedI',
  --   ext_opts = {
  --     [types.choiceNode] = {
  --       active = {
  --         virt_text = { { '<- choiceNode', 'Comment' } },
  --       },
  --     },
  --   },
  -- })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_lua').lazy_load()
  require('luasnip.loaders.from_snipmate').lazy_load()
  require('luasnip.loaders.from_lua').lazy_load({ paths = './snippets' })
  require('luasnip.loaders.from_snipmate').lazy_load({ paths = './snippets' })
  require('luasnip.loaders.from_vscode').lazy_load({ paths = { './snippets' } })
end

function config.nvim_autopairs()
  local Rule = require('nvim-autopairs.rule')
  local npairs = require('nvim-autopairs')

  npairs.setup({
    check_ts = true,
    -- enable_check_bracket_line = false,
    -- ignored_next_char = '[%w%.]', -- will ignore alphanumeric and `.` symbol
    -- ts_config = {
    --   lua = { 'string' }, -- it will not add a pair on that treesitter node
    --   javascript = { 'template_string' },
    --   java = false, -- don't check treesitter on java
    -- },
  })

  npairs.add_rules({
    Rule(' ', ' '):with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('( ', ' )')
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
    Rule('{ ', ' }')
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
    Rule('[ ', ' ]')
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']'),
  })
  npairs.add_rule(Rule("'''", "'''", 'python'))
end

return config
