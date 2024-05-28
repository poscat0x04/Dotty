return
{ 'stevearc/overseer.nvim'
, dependencies = { 'nvim-telescope/telescope.nvim', 'stevearc/dressing.nvim' }
, opts =
  { strategy =
    { 'toggleterm'
    , use_shell = true
    , direction = 'vertical'
    }
  }
}
