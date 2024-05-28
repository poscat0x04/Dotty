return
{ 'rcarriga/nvim-notify'
, event = 'VeryLazy'
, config = function()
    local stages_util = require("notify.stages.util")

    local custom_stage =
      { function(state)
          local next_height = state.message.height + 2
          local next_row = stages_util.available_slot(state.open_windows, next_height, stages_util.DIRECTION.BOTTOM_UP)
          if not next_row then
            return nil
          end
          return {
            relative = "editor",
            anchor = "NE",
            width = state.message.width,
            height = state.message.height,
            col = vim.opt.columns:get(),
            row = next_row - 2,
            border = "single",
            style = "minimal",
          }
        end
      , function()
          return {
            col = vim.opt.columns:get(),
            time = true,
          }
        end,
      }

    require('notify').setup(
    { level = 2
    , fps = 60
    , stages = custom_stage
    , timeout = 7000
    , top_down = false
    , render = 'wrapped-compact'
    , max_width = vim.o.columns * 0.3
    })
    vim.notify = require('notify')
  end
}
