{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1.25"
        "desc:XMI Redmi Monitor 2804800102242, highrr, auto, 1"
        ", preferred, auto, 1"
      ];

      exec-once = [
        "waybar"
        "fcitx5"
        "[workspace 2] kitty"
        "swww-daemon"
        "swww clear 000000"
      ];

      "$terminal" = "kitty";
      "$browser" = "google-chrome-stable --enable-wayland-ime";
      "$menu" = "wofi --show=drun | xargs hyprctl dispatch exec --";

      "$mainMod" = "SUPER";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
        # required until https://github.com/ankitects/anki/issues/1767 is closed
        "ANKI_WAYLAND, 1"
        # do not set GTK_IM_MODULE
        "GLFW_IM_MODULE, ibus"
        "QT_IM_MODULE, fcitx"
      ];

      input = {
        kb_layout = "us, ru";
        kb_options = "caps:escape, ctrl:swap_lalt_lctl, ctrl:swap_ralt_rctl";

        follow_mouse = 1;
        accel_profile = "adaptive";

        touchpad = {
          # disable_while_typing = true;
          natural_scroll = true;
          scroll_factor = 0.2;

          drag_lock = false;
          clickfinger_behavior = false;
          tap-and-drag = true;
        };

        tablet = {
          output = "HDMI-A-1";
        };

        # -1.0 - 1.0, 0 means no modification.
        sensitivity = 0.1;
      };

      general = {
        gaps_in = 2;
        gaps_out = 3;

        border_size = 1;
        "col.active_border" = "0xaa283744";
        "col.inactive_border" = "0x00000000";
      };

      cursor = {
        no_warps = true;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = false;
          size = 8;
          passes = 3;

          ignore_opacity = true;
        };

        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;

        shadow = {
          enabled = false;
          range = 30;
          render_power = 3;
          "color" = "0x70000000";
          "color_inactive" = "0x10000000";
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 0, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      gesture = [
        "3, horizontal, workspace"
      ];

      gestures = {
        workspace_swipe_create_new = false;
        workspace_swipe_forever = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;

        new_window_takes_over_fullscreen = 2;
        focus_on_activate = true;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      windowrulev2 = [
        "rounding 0, xwayland:1"
        "bordersize 1, xwayland:1"
        "bordercolor rgb(500050), xwayland:1"
      ];

      # tiling feels bad there
      windowrule = [
        "float,  title:Open File"
        "center, title:Open File"
      ];

      bind = [
        "$mainMod, C, killactive"
        "$mainMod, V, movecurrentworkspacetomonitor, +1"

        "$mainMod,       B, exec, $browser"
        "$mainMod SHIFT, B, exec, $browser --incognito"
        "$mainMod,       D, exec, $menu"
        "$mainMod,       T, exec, Telegram"
        "$mainMod,       Q, exec, $terminal"
        "$mainMod,       W, exec, killall -SIGUSR1 -r waybar"
        "$mainMod,       E, exec, [float] $terminal"
        "$mainMod SHIFT, L, exec, swaylock"
        "$mainMod SHIFT, S, exec, systemctl suspend"

        "$mainMod,       Tab, togglefloating, "
        "$mainMod,       P,   pseudo, "
        "$mainMod,       Y,   togglesplit, "
        "$mainMod,       F,   fullscreen"
        "$mainMod SHIFT, F,   fullscreenstate, -1 2"
        "$mainMod SHIFT, M,   exit, "
        "$mainMod SHIFT, W,   exec, swww clear 000000"

        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        "$mainMod CONTROL, H, movewindow, l"
        "$mainMod CONTROL, J, movewindow, d"
        "$mainMod CONTROL, K, movewindow, u"
        "$mainMod CONTROL, L, movewindow, r"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        ", XF86MonBrightnessUp,   exec, brightnessctl s +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        # screenshots
        '', print,     exec, grim -g "$(slurp -d -w 1)" - | wl-copy''
        "$mainMod, S, exec, grim - | wl-copy"

        # keyboard layout switching
        "$mainMod, Space, exec, hyprctl switchxkblayout all next"

        # i mean
        ''$mainMod SHIFT, O, exec, hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1"''
        "$mainMod, R, exec, hyprctl reload"

        # enabling decorations
        "$mainMod, O, exec, hyprctl keyword decoration:enabled true"
        "$mainMod, O, exec, hyprctl keyword decoration:blur:enabled true"
        "$mainMod, O, exec, hyprctl keyword decoration:inactive_opacity 0.75"
      ];

      # -e allows press and hold, volume limited to 150%
      binde = [
        ", xf86audioraisevolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", xf86audiolowervolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindl = ", switch:Lid Switch, exec, swaylock";

      # move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod,     mouse:272, movewindow"
        "$mainMod,     mouse:273, resizewindow"
        "$mainMod CONTROL, mouse:272, resizewindow"
      ];

      # layer rules:
      layerrule = [
        "noanim, waybar"
      ];
    };
  };
}
