local wezterm = require 'wezterm'

local config = {
  color_scheme = 'Dracula',
  font = wezterm.font_with_fallback({
    { family = "JetBrainsMono Nerd Font",  weight = "Bold" },
    { family = "Hiragino Kaku Gothic Pro", weight = "Bold" }, -- only effective on macOS
  }),
  font_size = 14.0,
  line_height = 0.85,
  hide_tab_bar_if_only_one_tab = true,
  -- window_background_opacity = 0.8,
  keys = {
    -- To capture Alt + Left/Right arrows
    -- https://github.com/wez/wezterm/issues/253#issuecomment-672007120
    { key = "LeftArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
    { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
  }
}

return config
