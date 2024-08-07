_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}
require('impatient')

-- require 'lua-config.Lspsaga'
require 'lua-config.Lsp_signature'

local telescope = require 'telescope'
local actions = require "telescope.actions"

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"latex", "phpdoc"},
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }

        }
    },
    indent = {
        enable = true,
        disable = { "python" }
    }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    --                opts)
    -- buf_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    --                opts)
    -- buf_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>',
    --                opts)

    buf_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
    buf_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
    buf_set_keymap("n", "K",  "<cmd>Lspsaga hover_doc<cr>", opts)
    buf_set_keymap("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
    buf_set_keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    buf_set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    buf_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", opts)
    buf_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", opts)


    vim.opt.signcolumn = 'yes'
    vim.api.nvim_command('highlight SignColumn guibg=None ctermbg=None')
end

local mason = require("mason")

mason.setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

lspconfig = require('lspconfig')
mason_lsp = require("mason-lspconfig")
mason_lsp.setup()
mason_lsp.setup_handlers {
    function (server_name)
        lspconfig[server_name].setup {on_attach = on_attach}
    end,
}

-- Setup nvim-cmp.
local cmp = require 'cmp'
local snippy = require("snippy")
snippy.setup({
    mappings = {
        is = {["<Tab>"] = "expand_or_advance", ["<S-Tab>"] = "previous"},
        nx = {["<leader>x"] = "cut_text"}
    }
})

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
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
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    sources = {
        {name = 'snippy'}, {name = 'nvim_lsp'}, {name = 'cmp_tabnine'},
        {name = 'buffer'}, {name = 'path'}, {name = 'cmdline'}
    }
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

require'nvim-tree'.setup {
    update_cwd = true,
    update_focused_file = {enable = true, update_cwd = true}
}

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

npairs.add_rules {
    Rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({'()', '[]', '{}'}, pair)
    end), Rule('( ', ' )'):with_pair(function() return false end):with_move(
        function(opts) return opts.prev_char:match('.%)') ~= nil end):use_key(
        ')'),
    Rule('{ ', ' }'):with_pair(function() return false end):with_move(
        function(opts) return opts.prev_char:match('.%}') ~= nil end):use_key(
        '}'), Rule('[ ', ' ]'):with_pair(function() return false end):with_move(
        function(opts) return opts.prev_char:match('.%]') ~= nil end):use_key(
        ']')
}
npairs.add_rule(Rule("'''", "'''", "python"))

require'nvim-lastplace'.setup {}

require("project_nvim").setup {
    patterns = {".git", "_darcs", ".hg", ".bzr", ".svn", "package.json"},
    manual_mode = true,
}

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            }
        }
    }
}
telescope.load_extension('projects')
telescope.load_extension('fzf')

-- local alpha = require 'alpha'
-- local dashboard = require 'alpha.themes.dashboard'
-- dashboard.section.header.val = {
--     [[                               __                ]],
--     [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
--     [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
--     [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
--     [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
--     [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]]
-- }
-- dashboard.section.buttons.val = {
--     dashboard.button("e", "?  New file", ":ene <BAR> startinsert <CR>"),
--     dashboard.button("p", "?  Projects", ":Telescope projects<CR>"),
--     dashboard.button("q", "?  Quit NVIM", ":qa<CR>")
-- }
-- local handle = io.popen('fortune')
-- local fortune = handle:read("*a")
-- handle:close()
-- dashboard.section.footer.val = fortune
-- alpha.setup(dashboard.opts)

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    -- dir = "git_dir",
    direction = "float",
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>",
                                    {noremap = true, silent = true})
    end,
    -- function to run on closing the terminal
    on_close = function(term) vim.cmd("Closing terminal") end
})

function _lazygit_toggle() lazygit:toggle() end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>",
                        {noremap = true, silent = true})

require("better_escape").setup {
    mapping = {"jk", "kj"}, -- a table with mappings to use
    timeout = 150, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>" -- keys used for escaping, if it is a function will use the result everytime
    -- example
    -- keys = function()
    --   return vim.fn.col '.' - 2 >= 1 and '<esc>l' or '<esc>'
    -- end,
}

if vim.g.sdubygui == 1 then
    require('mini.statusline').setup()
    local starter = require('mini.starter')
    starter.setup({
      evaluate_single = true,
      items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(10, false),
        -- Use this if you set up 'mini.sessions'
        starter.sections.sessions(5, true),
        starter.sections.telescope(),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.padding(3, 2),
      },
    })
end

require('mini.cursorword').setup()
require('mini.indentscope').setup {
    draw = {
        animation = require('mini.indentscope').gen_animation('none')
    }
}
-- require('mini.surround').setup()
require('mini.comment').setup()
require('mini.trailspace').setup()
require('mini.sessions').setup()


require('gitsigns').setup()
vim.api.nvim_command('highlight GitSignsAdd guibg=None ctermbg=None')
vim.api.nvim_command('highlight GitSignsChange guibg=None ctermbg=None')
vim.api.nvim_command('highlight GitSignsDelete guibg=None ctermbg=None')
