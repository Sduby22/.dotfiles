local function diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return function(client, bufnr)
  if vim.opt.diff:get() then
    return
  end

  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
    require('nvim-navbuddy').attach(client, bufnr)
  end

  local bufopts = { noremap = true, silent = true, buffer = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  vim.keymap.set('n', ']e', diagnostic_goto(true), bufopts)
  vim.keymap.set('n', '[e', diagnostic_goto(false), bufopts)
  vim.keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), bufopts)
  vim.keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), bufopts)
end
