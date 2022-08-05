local function command(name, to)
  vim.api.nvim_create_user_command(name, to, {})
end

command('Q', 'q')
command('W', 'w')
command('Wq', 'wq')
command('WQ', 'wq')
