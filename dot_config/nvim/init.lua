-- conceal
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'c'

-- misc config
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.mouse = 'a'
vim.wo.number = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.backup = false
vim.opt.writebackup = false
if vim.fn.has('unix') then
  vim.opt.shell = 'zsh'
else
  vim.opt.shell = 'pwsh.exe'
end

-- popup maxmium size
vim.opt.pumheight = 15
-- popup pseudo transparency
vim.opt.pumblend = 40


-- fillchars
vim.opt.fillchars = {
  eob = ' '
}

-- leaders
vim.g.mapleader = '\\'
vim.g.maplocalleader = ','

-- system clipboard
vim.opt.clipboard:append 'unnamedplus'

-- true colors
vim.opt.termguicolors = true

-- suda
vim.g.suda_smart_edit = 1

-- better whitespace
vim.g.better_whitespace_enabled = true
vim.g.strip_whitespace_on_save = true
vim.g.strip_whitespace_confirm = false

-- neovide
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_floating_blur_amount_x = 1.3
vim.g.neovide_floating_blur_amount_y = 1.3
--- don't show intro
vim.api.nvim_create_augroup("neovide_intro", {clear = true})
--- tweak linespace
vim.opt.linespace = -2


-- load library
require('lib')
-- load plugins
require('lazy-nvim')

-- load keybinds
require('keybind')
-- load autocmds
require('autocmd')


-- diagnostics
vim.diagnostic.config(
{ underline = true
, virtual_text = {
    spacing = 4,
  }
, update_in_insert = true
})

-- enable syntax highlighting
vim.cmd.syntax('enable')

-- disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
