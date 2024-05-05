local wezterm = require 'wezterm'

local config = {
  color_scheme = 'Dracula',
  font_size = 16,
  line_height = 0.75,
  hide_tab_bar_if_only_one_tab = true,
  -- window_background_opacity = 0.8,
  keys = {
    -- To capture Alt + Left/Right arrows
    -- https://github.com/wez/wezterm/issues/253#issuecomment-672007120
    { key = "LeftArrow",  mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
    { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
    -- disable Cmd + F search. TODO: only inside tmux
    { key = "f",          mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
  }
}

if wezterm.target_triple == "aarch64-apple-darwin" then
  config.font = wezterm.font_with_fallback({
    { family = "JetBrainsMono Nerd Font",  weight = "Bold" },
    { family = "Hiragino Kaku Gothic Pro", weight = "Bold" }, -- only effective on macOS
  })
end

return config
