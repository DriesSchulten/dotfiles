
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.native_macos_fullscreen_mode = true
config.font_size = 11.0
config.color_scheme = "Catppuccin Mocha"

local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.default_prog = { '/opt/homebrew/bin/tmux', 'new', '-A', '-s', 'main' }

return config