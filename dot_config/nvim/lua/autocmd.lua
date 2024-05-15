-- remember fold levels
local group1 = vim.api.nvim_create_augroup('remember_folds', {clear = true})

vim.api.nvim_create_autocmd('BufWinLeave',
{ pattern = '*'
, command = 'silent! mkview'
, group = group1
})

vim.api.nvim_create_autocmd('BufWinEnter',
{ pattern = '*'
, command = 'silent! loadview'
, group = group1
})

local group2 = vim.api.nvim_create_augroup('nvim_tree_start_exit', {clear = true})

-- auto start nvim tree if not editing files
vim.api.nvim_create_autocmd('VimEnter',
{ pattern = '*'
, callback = function()
    if vim.fn.argc() == 0
      and vim.fn.exists('s:std_in') == 0
      and vim.v.this_session == ''
      and not vim.opt.readonly._value then
      local api = require('nvim-tree.api')
      mylib.preserve_focus(api.tree.toggle)()
    end
  end
, group = group2
})

-- auto exit nvim if last buffer is nvim tree
vim.api.nvim_create_autocmd('BufEnter',
{ pattern = '*'
, callback = function()
    if vim.fn.winnr('$') == 1
      and vim.bo.filetype == 'NvimTree' then
      vim.cmd.q()
    end
  end
, group = group2
})

local group3 = vim.api.nvim_create_augroup('post_start_tasks', {clear = true})

-- update all plugins post start
vim.api.nvim_create_autocmd('User',
{ pattern = 'VeryLazy'
, callback = function()
    vim.schedule(function()
      require('lazy').sync({wait = false, show = false})
    end)
  end
, group = group3
})

-- barbecue #92
vim.api.nvim_create_autocmd('TermEnter',
{ callback = function() require('barbecue.ui').update() end
, group = vim.api.nvim_create_augroup('barbecue.updater', {})
})
