-- move to end
vim.api.nvim_set_keymap('i', '<C-e>', '<Esc>$a', {noremap=true})

-- shift+insert to paste
vim.api.nvim_set_keymap('i', '<S-Insert>', '<C-R>*', {})

-- paste in command mode in neovide
vim.api.nvim_set_keymap('c', '<C-S-v>', '<C-r>+', {})

-- insert in pairs
-- vim.api.nvim_set_keymap('i', '"', '""<left>', {noremap=true})
-- vim.api.nvim_set_keymap('i', '\'', '\'\'<left>', {noremap=true})
-- vim.api.nvim_set_keymap('i', '(', '()<left>', {noremap=true})
-- vim.api.nvim_set_keymap('i', '{', '{}<left>', {noremap=true})
-- vim.api.nvim_set_keymap('i', '[', '[]<left>', {noremap=true})
