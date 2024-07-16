{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-Space";
    terminal = "tmux-256color";
    clock24 = true;
    baseIndex = 1;
    escapeTime = 10;
    historyLimit = 5000;
    extraConfig = ''
      set-option -g focus-events on
      set-option -sa terminal-features ',xterm-kitty:RGB'
      set -g status-style 'bg=#000000 fg=#302730'
      set -g renumber-windows on
    '';
  };
}
