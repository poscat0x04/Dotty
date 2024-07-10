return
{ 'nvim-treesitter/nvim-treesitter'
, lazy = false
, opts =
  { ensure_installed =
    { 'c', 'cpp', 'lua', 'json', 'toml', 'xml', 'html', 'rust', 'haskell', 'python'
    , 'bash', 'agda', 'diff', 'dhall', 'nix', 'meson', 'latex', 'yaml', 'ssh_config'
    , 'ocaml', 'css', 'git_config', 'gitcommit', 'gitignore', 'vim', 'vimdoc', 'query'
    , 'markdown', 'markdown_inline', 'pem', 'sql', 'typst', 'go', 'gomod', 'gosum'
    , 'gowork', 'comment', 'bibtex', 'javascript', 'kotlin', 'luadoc', 'java', 'scala'
    , 'purescript', 'racket', 'typescript', 'zig', 'git_rebase', 'doxygen', 'csv', 'cmake'
    , 'cuda', 'make', 'mlir', 'llvm', 'qmljs', 'qmldir', 'hcl'
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
