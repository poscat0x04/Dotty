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
, onehalflight =
  {
  }
}

local colors =
{ blackgray = '#282c34'
, bluegray = '#828c99'
, lightbluegray = '#5d677a'
, lightlightbluegray = '#dcdfe4'
, lightgray = '#d3d3d3'
, white = '#f3f3f3'
, yellow = '#e5c07b'
, red = '#e06c75'
, magenta = '#c678dd'
, blue = '#61afef'
, cyan = '#56b6c2'
, green = '#98c379'
}

mylib.onehalflight.normal =
{ a =
  { fg = colors.blackgray
  , bg = colors.green
  }
, b =
  { fg = colors.lightbluegray
  , bg = colors.lightgray
  }
, c =
  { fg = colors.bluegray
  , bg = colors.white
  }
}

mylib.onehalflight.insert =
{ a =
  { fg = colors.blackgray
  , bg = colors.blue
  }
, b =
  { fg = colors.lightbluegray
  , bg = colors.lightgray
  }
}

mylib.onehalflight.visual =
{ a =
  { fg = colors.blackgray
  , bg = colors.yellow
  }
, b =
  { fg = colors.lightbluegray
  , bg = colors.lightgray
  }
}

mylib.onehalflight.replace =
{ a =
  { fg = colors.blackgray
  , bg = colors.red
  }
, b =
  { fg = colors.lightbluegray
  , bg = colors.lightgray
  }
}

mylib.onehalflight.command = mylib.onehalflight.normal

mylib.onehalflight.inactive =
{ a =
  { fg = colors.lightlightbluegray
  , bg = colors.lightbluegray
  }
, b =
  { fg = colors.lightbluegray
  , bg = colors.lightgray
  }
, c =
  { fg = colors.bluegray
  , bg = colors.white
  }
}
