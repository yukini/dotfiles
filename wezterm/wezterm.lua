-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- theme
config.color_scheme = 'Afterglow'

-- tab
config.hide_tab_bar_if_only_one_tab = true

-- window
config.window_background_opacity = 0.95
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = { left = 10, right = 10, top = 50, bottom = 5, }

-- font
config.font = wezterm.font("HackGen35 Console NF")
config.font_size = 14.0

-- and finally, return the configuration to wezterm
return config
