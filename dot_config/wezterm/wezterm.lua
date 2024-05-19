local wezterm = require("wezterm")
local config = {}

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Frappe"
	else
		return "Catppuccin Mocha"
	end
end

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme_dirs = { "$HOME/.config/wezterm/colors" }
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.adjust_window_size_when_changing_font_size = false

-- config.default_cursor_style = "BlinkingBlock"
config.line_height = 1.0
config.font_size = 19.0
config.font = wezterm.font_with_fallback({
	{ family = "MonoLisa", scale = 1.0 },
	{ family = "JetBrains Mono", scale = 1.0 },
	{ family = "CommitMonolineonetwo", scale = 1.0 },
	{ family = "CommitMono", scale = 1.0 },
	{ family = "MonolisaZero Nerd Font Mono", scale = 1.2 },
	{ family = "Source Code Pro", scale = 1.2 },
	{ family = "JetBrains Mono", scale = 1.2 },
})

-- color_scheme = 'termnial.sexy',
config.enable_tab_bar = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
-- config.use_ime = false

config.macos_window_background_blur = 100

config.window_background_opacity = 0.8
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
	--
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config

