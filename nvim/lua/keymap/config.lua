-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, omap, map = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.omap, keymap.map
local silent, noremap, callback = keymap.silent, keymap.noremap, keymap.callback
local opts = keymap.new_opts
local cmd = keymap.cmd

function diff_then_else(then_, else_)
  return function()
    if vim.opt.diff:get() then
      vim.api.nvim_input(then_)
    else
      vim.api.nvim_input(else_)
    end
  end
end

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

map({
  { '<M-l>', cmd('bn'), opts(noremap) },
  { '<M-h>', cmd('bp'), opts(noremap) },
  { '<C-s>', cmd('write'), opts(noremap) },
  { '<M-s>', cmd('write'), opts(noremap) },
  { '<M-w>', cmd('bd'), opts(noremap) },
})

-- usage example
nmap({
  -- noremal remap
  -- close buffer
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  -- buffer jump
  { '<leader>bn', cmd('bn'), opts(noremap) },
  { '<leader>bp', cmd('bp'), opts(noremap) },
  { '<leader>bk', cmd('bd'), opts(noremap) },
  -- remove trailing white space
  { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
  -- window
  { '<leader>w', '<C-w>', opts(noremap) },
})

nmap({
  -- yank
  { 'Y', 'y$', opts(noremap) },
  { 'Y', 'y$', opts(noremap) },
}, 'both')

omap({
  { 's', cmd('<Plug>Sneak_s'), opts(noremap) },
  { 'S', cmd('<Plug>Sneak_S'), opts(noremap) },
}, 'both')

xmap({
  { '<C-0>', cmd('<Plug>Sneak_s'), opts(noremap) },
  { '<C-0>', cmd('<Plug>Sneak_S'), opts(noremap) },
  -- surround
  { 's', 'S' },
}, 'both')

imap({
  -- insert mode
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })
