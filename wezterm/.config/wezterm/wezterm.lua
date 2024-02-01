-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.color_scheme = "OneDark (base16)"
config.line_height = 1.2
config.font = wezterm.font("MonaspiceNe NF")
config.font_size = 14
config.harfbuzz_features =
  { "calt", "liga", "dlig", "zero", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" }

-- and finally, return the configuration to wezterm
return config
