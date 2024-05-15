return
{ 'neovim/nvim-lspconfig'
, event = {'BufReadPre', 'BufNewFile'}
, dependencies =
  { 'hrsh7th/cmp-nvim-lsp'
  , 'folke/neodev.nvim'
  }
, config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require 'lspconfig'
    lspconfig.rust_analyzer.setup {
      capabilities = capabilities
    }
    lspconfig.lua_ls.setup {
      capabilities = capabilities
    }
    lspconfig.typst_lsp.setup {
      capabilities = capabilities
    }
  end
}
