-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()



-- This is where you actually apply your config choices.
-- ENV
config.term = "xterm-256color"


-- LAUNCH
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "powershell.exe", "-NoLogo" }
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" or
       wezterm.target_triple == "x86_64-apple-darwin" or
       wezterm.target_triple == "aarch64-apple-darwin" then
  config.default_prog = { "zsh", "-l" }
else
  config.default_prog = nil
end


-- FONT
config.font = wezterm.font_with_fallback {
  { family = "Maple Mono Normal NL NF CN" },
  { family = "CaskaydiaCove Nerd Font Mono" },
  { family = "JetBrains Mono" },
}
config.font_size = 12.0
config.line_height = 1.0


-- KEYBOARD
config.keys = {
  -- `CTRL+SHIFT+SPACE` for "Copy Mode"
  {
    key = "Space",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivateCopyMode,
  },
  -- `CTRL+SHIFT+X` for "Quick Select Mode"
  {
    key = "X",
    mods = "CTRL|SHIFT",
    action = wezterm.action.QuickSelect,
  },
}


-- APPEARANCE
config.initial_cols = 120
config.initial_rows = 50

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Light"
end

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return wezterm.plugin.require("https://github.com/neapsix/wezterm").moon
  else
    return wezterm.plugin.require("https://github.com/neapsix/wezterm").dawn
  end
end

local theme = scheme_for_appearance(get_appearance())
config.colors = theme.colors()
config.window_frame = theme.window_frame() -- needed only if using fancy tab bar



-- Finally, return the configuration to wezterm:
return config
