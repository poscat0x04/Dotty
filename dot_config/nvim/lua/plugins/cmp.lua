return
{ 'hrsh7th/nvim-cmp'
, event = {'InsertEnter', 'CmdlineEnter'}
, dependencies =
  { 'hrsh7th/cmp-buffer'
  , 'hrsh7th/cmp-nvim-lsp'
  , 'hrsh7th/cmp-path'
  , 'hrsh7th/cmp-cmdline'
  , 'L3MON4D3/LuaSnip'
  , 'saadparwaiz1/cmp_luasnip'
  , 'zbirenbaum/copilot-cmp'
  , 'onsails/lspkind.nvim'
  }
, config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'
    local fmt_config =
      { fields = {'abbr', 'kind', 'menu'}
      , format = lspkind.cmp_format(
        { mode = 'symbol_text'
        , menu =
          { buffer = '[buf]'
          , nvim_lsp = '[lsp]'
          , path = '[path]'
          , luasnip = '[snip]'
          , cmdline = '[cmd]'
          }
        })
      }
    local main_opt =
      { snippet =
        { expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        }
      , sources = cmp.config.sources
        ( { { name = 'nvim_lsp' }
          , { name = 'path' }
          }
        , { { name = 'buffer', keyword_length = 4 } }
        )
      , view =
        { docs = {auto_open = true}
        }
      , formatting = fmt_config
      , mapping =
        { ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
              end
              cmp.confirm()
            else
              fallback()
            end
          end, {"i","s","c",})
          --[[
        { ['<C-y>'] = cmp.mapping.confirm
            { behavior = cmp.ConfirmBehavior.Insert
            , select = true
            }
          --]]
        , ['<C-n>'] = cmp.mapping.select_next_item()
        , ['<C-p>'] = cmp.mapping.select_prev_item()
        , ['<C-b>'] = cmp.mapping.scroll_docs(-4)
        , ['<C-f>'] = cmp.mapping.scroll_docs(4)
        , ['<C-g>'] = function()
            if cmp.visible_docs() then
              cmp.close_docs()
            else
              cmp.open_docs()
            end
          end
        }
      }

    -- setup main completion
    require'cmp'.setup(main_opt)


    cmp.setup.cmdline('/'
    , { mapping = cmp.mapping.preset.cmdline()
      , sources = {{name = 'buffer', keyword_length = 4}}
      , view =
        { docs = {auto_open = true}
        }
      , formatting = fmt_config
      }
    )

    cmp.setup.cmdline(':'
    , { mapping = cmp.mapping.preset.cmdline()
      , sources = cmp.config.sources
        ( {{name = 'path'}}
        , {{name = 'cmdline'}}
        )
      , view =
        { docs = {auto_open = true}
        }
      , formatting = fmt_config
      }
    )
  end
}
