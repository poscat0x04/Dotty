return
{ 'akinsho/toggleterm.nvim'
, opts =
  { float_opts =
    { border = 'single'
    , winblend = 20
    }
  , size = function(term)
      if term.direction == 'horizontal' then
        return 13
      elseif term.direction == 'vertical' then
        return math.max(20, vim.o.columns * 0.35)
      end
    end
  }
}
