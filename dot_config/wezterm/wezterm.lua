local wezterm = require("wezterm")
local config = {}

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Catppuccin Frappe"
  else
    return "Catppuccin Latte"
  end
end

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme_dirs = { "$HOME/.config/wezterm/colors" }
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
-- config.default_gui_startup_args = { 'connect', 'unix' }
-- local dimmer = { brightness = 0.3 }
-- config.background = {
--   {
--     source = {
--       File = '$HOME/.config/wezterm/back12.jpeg',
--     },
--     -- width = '100%',
--     -- height = '100%',
--     -- opacity = 0.96,
--     hsb = dimmer,
--   }
-- }

config.adjust_window_size_when_changing_font_size = false

-- config.default_cursor_style = "BlinkingBlock"
config.line_height = 1.0
config.font = wezterm.font_with_fallback({
  { family = "MonoLisa",                    scale = 1.0 },
  { family = "CommitMonolineonetwo",        scale = 1.0 },
  { family = "CommitMono",                  scale = 1.0 },
  { family = "MonolisaZero Nerd Font Mono", scale = 1.2 },
  { family = "Source Code Pro",             scale = 1.2 },
  { family = "JetBrains Mono",              scale = 1.2 },
})

-- color_scheme = 'termnial.sexy',
config.enable_tab_bar = false
config.font_size = 13.0
-- config.macos_window_background_blur = 30

-- window_background_image = '/Users/omerhamerman/Downloads/3840x1080-Wallpaper-041.jpg',
-- window_background_image_hsb = {
-- 	brightness = 0.01,
-- 	hue = 1.0,
-- 	saturation = 0.5,
-- },
-- window_background_opacity = 0.92,
-- config.window_background_opacity = 0.9
-- window_background_opacity = 0.78,
-- window_background_opacity = 0.20,
-- config.window_decorations = 'RESIZE'
config.keys = {
  {
    key = "z",
    mods = "ALT",
    action = wezterm.action.ToggleFullScreen,
  },
}
config.mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

return config
