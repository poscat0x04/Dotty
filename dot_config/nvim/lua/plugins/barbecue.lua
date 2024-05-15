return
{ 'utilyre/barbecue.nvim'
, lazy = false
, dependencies =
  { 'SmiteshP/nvim-navic'
  , 'sonph/onehalf'
  , 'nvim-tree/nvim-web-devicons'
  }
, opts =
  { exclude_filetypes = {'toggleterm'}
  }
, config = true
}
