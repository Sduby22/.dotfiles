local wezterm = require 'wezterm';
return {
  font = wezterm.font_with_fallback({
    "Monaco for Powerline",
    "Sarasa Mono SC Nerd",
    "Apple Color Emoji",
  }),
  font_size = 18,
  line_height=1.2,
  harfbuzz_features = {"liga=0"},

  use_ime = true,

  window_decorations = "NONE",
  window_padding = {
    left = 10,
    right = 5,
    top = 10,
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
  }
}
