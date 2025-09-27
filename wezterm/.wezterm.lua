local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- General --
config.font_size = 16
config.line_height = 1
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "catppuccin-mocha"
config.audible_bell = "Disabled"

-- Window
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = 0,
}

-- Keys --
config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOH" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action({ SendString = "\x1bOF" }),
	},
}

return config
