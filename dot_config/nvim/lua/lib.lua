mylib =
{ preserve_focus = function(f)
    return function()
      local window = vim.api.nvim_get_current_win()
      f()
      if vim.api.nvim_win_is_valid(window) then
        vim.api.nvim_set_current_win(window)
      end
    end
  end
, onehalfdark =
  {
  }
}

local colors =
{ mono0 = '#282c34'
, mono1 = '#313640'
, mono2 = '#5d677a'
, mono3 = '#dcdfe4'
, yellow = '#e5c07b'
, red = '#e06c75'
, magenta = '#c678dd'
, blue = '#61afef'
, cyan = '#56b6c2'
, green = '#98c379'
}

-- mix color
local function mix(a, b)
  local a1 = tonumber(string.sub(a,2,3),16)
  local a2 = tonumber(string.sub(a,4,5),16)
  local a3 = tonumber(string.sub(a,6,7),16)
  local b1 = tonumber(string.sub(b,2,3),16)
  local b2 = tonumber(string.sub(b,4,5),16)
  local b3 = tonumber(string.sub(b,6,7),16)
  return table.concat(
  { '#'
  , string.format('%x', math.floor((a1 + b1)/2))
  , string.format('%x', math.floor((a2 + b2)/2))
  , string.format('%x', math.floor((a3 + b3)/2))
  })
end

mylib.onehalfdark.normal =
{ a =
  { fg = colors.mono0
  , bg = colors.green
  }
, b =
  { fg = colors.mono3
  , bg = colors.mono2
  }
, c =
  { fg = colors.green
  , bg = colors.mono1
  }
}

mylib.onehalfdark.insert =
{ a =
  { fg = colors.mono0
  , bg = colors.blue
  }
, b =
  { fg = colors.mono3
  , bg = colors.mono2
  }
, c =
  { fg = colors.blue
  , bg = colors.mono1
  }
}

mylib.onehalfdark.visual =
{ a =
  { fg = colors.mono0
  , bg = colors.yellow
  }
, b =
  { fg = colors.mono3
  , bg = colors.mono2
  }
, c =
  { fg = colors.yellow
  , bg = colors.mono1
  }
}

mylib.onehalfdark.replace =
{ a =
  { fg = colors.mono0
  , bg = colors.red
  }
, b =
  { fg = colors.mono3
  , bg = colors.mono2
  }
, c =
  { fg = colors.red
  , bg = colors.mono1
  }
}

mylib.onehalfdark.command = mylib.onehalfdark.normal

mylib.onehalfdark.inactive =
{ a =
  { fg = colors.mono3
  , bg = colors.mono2
  }
, b =
  { fg = colors.mono3
  , bg = colors.mono2
  }
, c =
  { fg = colors.mono3
  , bg = colors.mono1
  }
}
