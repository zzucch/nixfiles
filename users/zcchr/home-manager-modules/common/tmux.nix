{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-Space";
    terminal = "tmux-256color";
    clock24 = true;
    baseIndex = 1;
    escapeTime = 10;
    historyLimit = 100000;
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      set -g renumber-windows on

      set-option -g focus-events on
      set-option -sa terminal-features ',xterm-kitty:RGB'

      set -g status-style 'bg=#000000 fg=#3c6e5c'
      set-option -g status-right '#[align=absolute-centre]#[align=right]%H:%M %a-%d-%b'

      bind-key -r C-t run-shell "tmux neww tmux-sessionizer"
      bind -r D neww -c "#{pane_current_path}" "[[ -e TODO.md ]] && nvim TODO.md || nvim ~/TODO.md"
    '';
  };
}
