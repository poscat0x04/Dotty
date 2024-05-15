return
{ 'folke/neodev.nvim'
, dependencies = {'neovim/nvim-lspconfig'}
, opts =
  { library =
    { enabled = true
    , runtime = true
    , types = true
    , plugins = true
    }
  , setup_jsonls = false
  , lspconfig = true
  , pathStrict = true
  }
}
