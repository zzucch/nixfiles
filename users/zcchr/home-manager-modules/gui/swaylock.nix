{
  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      ignore-empty-password = true;
      show-failed-attempts = true;
      indicator-idle-visible = true;
      show-keyboard-layout = true;
      indicator-radius = 120;
      font-size = 16;
      color = "000000";
      ring-color = "5a5277";
      ring-clear-color = "000000";
      ring-ver-color = "000000";
      line-color = "000000";
      key-hl-color = "c0caf5";
      inside-color = "000000";
      inside-ver-color = "000000";
      inside-wrong-color = "f15d22";
      text-color = "c0caf5";
    };
  };
}
