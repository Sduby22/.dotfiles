local wezterm = require 'wezterm';

local myfonts = wezterm.font_with_fallback({
  { family = "Terminus", style = "Normal" },
  { family = "WenQuanYi Zen Hei Sharp", style = "Normal" },
})


return {
  font = myfonts,
  font_size = 12,

  font_rules = {
    {
      italic = true,
      font = myfonts
    }
  }
}
