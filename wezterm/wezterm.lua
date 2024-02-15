local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- theme
config.color_scheme = 'Afterglow'

-- tab
config.enable_tab_bar = false

-- window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = { left = 10, right = 10, top = 50, bottom = 5 }
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

-- font
config.font = wezterm.font_with_fallback {
  { family = "HackGen35 Console NF" },
  { family = "Hack Nerd Font Mono" },
  { family = "Menlo" },
}
config.font_size = 15.0

-- IME
config.use_ime = true
config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

-- key bindings
config.keys = {
  {
    key = 'Return',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
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
