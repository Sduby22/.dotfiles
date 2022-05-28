local wezterm = require 'wezterm';
local config = require 'config';
return {
  default_prog = {"fish"},
  font = wezterm.font_with_fallback(config.fonts),
  font_size = config.font_size,
  -- harfbuzz_features = {"liga=0"},

  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  skip_close_confirmation_for_processes_named = {
    "bash", "sh", "zsh", "fish", "tmux"
  }, 
  window_close_confirmation = "NeverPrompt",
  enable_tab_bar = false,

  mouse_bindings = {
    {
      event={Drag={streak=1, button="Left"}},
      mods="ALT",
      action="StartWindowDrag"
    },
  },

  warn_about_missing_glyphs = false
}
