{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 22;
      background_opacity = "0.5";
      foreground = "#b0b0b0";
      dynamic_background_opacity = true;
      hide_window_decorations = true;
      enable_audio_bell = false;
      "map kitty_mod+f6" = "change_font_size current 28";
    };
  };
}
