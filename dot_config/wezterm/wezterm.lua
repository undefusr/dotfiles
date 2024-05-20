local wezterm = require("wezterm")
local config = {}

---@diagnostic disable-next-line: unused-function
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "NvimDark"
	else
		return "NvimLight"
	end
end

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.adjust_window_size_when_changing_font_size = false

config.default_cursor_style = "BlinkingBlock"

config.font = wezterm.font_with_fallback({
	{ family = "Monolisa", scale = 1.0 },
	{ family = "JetBrains Mono", scale = 1.0 },
	{ family = "CommitMonolineonetwo", scale = 1.0 },
	{ family = "CommitMono", scale = 1.0 },
	{ family = "MonolisaZero Nerd Font Mono", scale = 1.2 },
	{ family = "Source Code Pro", scale = 1.2 },
	{ family = "JetBrains Mono", scale = 1.2 },
})
config.font_size = 15

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

config.window_padding = {
	left = 40,
	right = 50,
	top = 60,
	bottom = 60,
}

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

config.window_decorations = "TITLE|RESIZE"

local act = wezterm.action
config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "t", mods = "SUPER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "n", mods = "SUPER", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
	{ key = "l", mods = "SUPER", action = "ActivateLastTab" },
	{ key = "-", mods = "SUPER", action = "ActivateCopyMode" },
	-- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
	{ key = "8", mods = "CTRL", action = act.PaneSelect },
	-- activate pane selection mode with numeric labels
	{
		key = "9",
		mods = "CTRL",
		action = act.PaneSelect({
			alphabet = "ueoa",
		}),
	},
	-- show the pane selection mode, but have it swap the active and selected panes
	{
		key = "0",
		mods = "CTRL",
		action = act.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = ";",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "'",
		mods = "SUPER",
		action = wezterm.action({
			QuickSelectArgs = {
				patterns = {
					"(?:')(.*)(?:')",
				},
			},
		}),
	},
	{
		key = '"',
		mods = "SUPER|SHIFT",
		action = wezterm.action({
			QuickSelectArgs = {
				patterns = {
					'(?:")(.*)(?:")',
				},
			},
		}),
	},
	{
		key = "u",
		mods = "SUPER",
		action = wezterm.action({
			QuickSelectArgs = {
				patterns = {
					"https?://\\S+",
				},
				action = wezterm.action_callback(function(window, pane)
					local url = window:get_selection_text_for_pane(pane)
					wezterm.log_info("opening: " .. url)
					wezterm.open_with(url)
				end),
				alphabet = "dvorak",
			},
		}),
	},
	{
		key = "z",
		mods = "ALT",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "|",
		mods = "SUPER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "_",
		mods = "SUPER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Send "CTRL-SPACE" to the terminal when pressing CTRL-SPACE, CTRL-SPACE
	{
		key = " ",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
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
