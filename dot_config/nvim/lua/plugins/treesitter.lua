return
{ 'nvim-treesitter/nvim-treesitter'
, lazy = false
--, version = false
, opts =
  { ensure_installed =
    { 'c', 'cpp', 'lua', 'json', 'toml', 'xml', 'html', 'rust', 'haskell', 'python'
    , 'bash', 'agda', 'diff', 'dhall', 'nix', 'meson', 'latex', 'yaml', 'ssh_config'
    , 'ocaml', 'css', 'git_config', 'gitcommit', 'gitignore', 'vim', 'vimdoc', 'query'
    , 'markdown', 'markdown_inline', 'pem', 'sql'--, typst'
    }
  , auto_install = false
  , sync_install = false
  , highlight =
    { enable = true
    , additional_vim_regex_highlighting = false
    }
  }
, build = function()
    require('nvim-treesitter.install').update({with_sync = true})
  end
, config = function(_,opts)
    require('nvim-treesitter.configs').setup(opts)
  end
}
