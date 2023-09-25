-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, omap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.omap, keymap.tmap
local silent, noremap, expr = keymap.silent, keymap.noremap, keymap.expr
local opts = keymap.new_opts
local cmd = keymap.cmd

local function diff_then_else(then_, else_)
  return function()
    if vim.opt.diff:get() then
      return then_
    else
      return else_
    end
  end
end

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

nmap({
  { '<C-s>', cmd('write'), opts(noremap) },
  { '<M-l>', cmd('bn'), opts(noremap) },
  { '<M-h>', cmd('bp'), opts(noremap) },
  { '<M-s>', cmd('write'), opts(noremap) },
  { '<M-w>', cmd('bd'), opts(noremap) },
})

nmap({
  {
    '<C-j>',
    diff_then_else(']c', '<C-j>'),
    opts(noremap, expr),
  },
  {
    '<C-k>',
    diff_then_else('[c', '<C-k>'),
    opts(noremap, expr),
  },
})

-- usage example
nmap({
  -- noremal remap
  -- close buffer
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  -- buffer jump
  { '<leader>bn', cmd('bn'), opts(noremap) },
  { '<leader>bp', cmd('bp'), opts(noremap) },
  -- { '<leader>bk', cmd('bd'), opts(noremap) },
  -- window
  { '<leader>w', '<C-w>', opts(noremap) },
})

nmap({
  -- yank
  { 'Y', 'y$', opts(noremap) },
  { 'Y', 'y$', opts(noremap) },
}, 'both')

local function tabnew()
  vim.cmd('$tabnew')
  vim.cmd('Telescope workspaces')
end

nmap({
  { '<leader><tab>n', tabnew, opts(noremap) },
  { '<leader><tab>1', cmd('tabn 1'), opts(noremap) },
  { '<leader><tab>2', cmd('tabn 2'), opts(noremap) },
  { '<leader><tab>3', cmd('tabn 3'), opts(noremap) },
  { '<leader><tab>4', cmd('tabn 4'), opts(noremap) },
  { '<leader><tab>5', cmd('tabn 5'), opts(noremap) },
  { '<leader><tab>6', cmd('tabn 6'), opts(noremap) },
  { '<leader><tab>7', cmd('tabn 7'), opts(noremap) },
  { '<leader><tab>8', cmd('tabn 8'), opts(noremap) },
  { '<leader><tab>9', cmd('tabn 9'), opts(noremap) },
})

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

tmap({ '<ESC>', '<C-\\><C-n>', opts(noremap) })

nmap({ 'yg', 'y<C-g>', opts(noremap) })
nmap({ ',', '%', opts(noremap) })

-- noremap Q q
-- noremap q <Nop>

vim.keymap.set('', 'Q', 'q', { noremap = true })
vim.keymap.set('', 'q', '<Nop>', { noremap = true })
