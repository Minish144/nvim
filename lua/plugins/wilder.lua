return {
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      local wilder = require("wilder")

      wilder.setup({
        modes = { ":", "/", "?" },
        next_key = "<Tab>",
        previous_key = "<S-Tab>",
        accept_key = "<Down>",
        reject_key = "<Up>",
      })

      local highlighter = wilder.basic_highlighter()
      local left = { " ", wilder.popupmenu_devicons() }
      local right = { " ", wilder.popupmenu_scrollbar() }

      wilder.set_option(
        "renderer",
        wilder.renderer_mux({
          [":"] = wilder.popupmenu_renderer({
            highlighter = highlighter,
            left = left,
            right = right,
          }),
          ["/"] = wilder.popupmenu_renderer({
            highlighter = highlighter,
            left = left,
            right = { " ", wilder.popupmenu_scrollbar() },
          }),
          ["?"] = wilder.popupmenu_renderer({
            highlighter = highlighter,
            left = left,
            right = { " ", wilder.popupmenu_scrollbar() },
          }),
        })
      )
    end,
  },
}
