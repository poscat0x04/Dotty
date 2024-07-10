return
{ 'nvim-lualine/lualine.nvim'
, dependencies = {'nvim-tree/nvim-web-devicons', 'utilyre/barbecue.nvim'}
, lazy = false
, opts =
  { options =
    { theme = mylib.onehalflight
    , component_separators = '|'
    , section_separators = ''
    , disabled_filetypes =
      { statusline = {"NvimTree"}
      }
    , globalstatus = true
    }
  , sections =
    { lualine_a = {'mode'}
    , lualine_b = {'branch', 'diff', 'diagnostics', 'filename'}
    , lualine_c = {}
    , lualine_x = {'fileformat', 'encoding', 'filetype'}
    , lualine_y = {'progress'}
    , lualine_z = {'location'}
    }
  , inactive_sections =
    { lualine_a = {}
    , lualine_b = {'filename'}
    , lualine_c = {}
    , lualine_x = {'location'}
    , lualine_y = {}
    , lualine_z = {}
    }
  }
}
