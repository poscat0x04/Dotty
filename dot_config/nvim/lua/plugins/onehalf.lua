return
{ 'sonph/onehalf'
, lazy = false
, config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. '/vim')
    vim.cmd.colorscheme('onehalflight')
  end
}
