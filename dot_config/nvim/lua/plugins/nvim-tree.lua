return
{ 'nvim-tree/nvim-tree.lua'
, dependencies = {'nvim-tree/nvim-web-devicons', 'sonph/onehalf'}
, keys =
  { {'<leader>ft', mylib.preserve_focus(function()require('nvim-tree.api').tree.toggle()end)}
  }
, config = function()
    require('nvim-tree').setup
    { sync_root_with_cwd = true
    }
  end
}
