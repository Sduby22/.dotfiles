local key = require('core.keymap')
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd
local opts = { noremap = true, silent = true }

nmap({
  { '<space>e', vim.diagnostic.open_float, opts },
  { '[d', vim.diagnostic.goto_prev, opts },
  { ']d', vim.diagnostic.goto_next, opts },
  { '<space>q', vim.diagnostic.setloclist, opts },
})
