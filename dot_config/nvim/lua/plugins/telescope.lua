return
{ 'nvim-telescope/telescope.nvim'
, dependencies =
  { 'nvim-lua/plenary.nvim'
  , 'nvim-tree/nvim-web-devicons'
  }
, config = function()
    require('telescope').setup(
    { defaults =
      { mappings =
        { n =
          { ['<C-d>'] = require('telescope.actions').delete_buffer
          }
        , i =
          { ['<C-d>'] = require('telescope.actions').delete_buffer
          , ['<C-h>'] = 'which_key'
          }
        }
      }
    , pickers =
      {
      }
    , extensions =
      {
      }
    })
  end
}
