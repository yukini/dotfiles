local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- theme
config.color_scheme = 'Afterglow'

-- tab
config.enable_tab_bar = false

-- window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = { left = 20, right = 20, top = 40, bottom = 5 }
config.window_background_opacity = 0.85
config.macos_window_background_blur = 90

-- font
config.font = wezterm.font({ family = "HackGen35 Console NF", weight = "Regular" })
config.font = wezterm.font({ family = "PlemolJP35 Console NF", weight = "Medium" })
-- config.font = wezterm.font({ family = "Moralerspace Neon NF", weight = "Regular" })
config.line_height = 1.05
config.font_size = 15.0

-- IME
config.use_ime = true
config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

-- Use ALT instead of SHIFT to bypass application mouse reporting
config.bypass_mouse_reporting_modifiers = 'ALT'

-- key bindings
config.keys = {
  {
    key = 'Return',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'c',
    mods = 'CMD',
    action = wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor 'Clipboard',
  },
  {
    key = 'v',
    mods = 'CMD',
    action = wezterm.action({ PasteFrom = "Clipboard" }),
  },
}
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = wezterm.action({ PasteFrom = "Clipboard" }),
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor 'Clipboard',
  },
}

return config
