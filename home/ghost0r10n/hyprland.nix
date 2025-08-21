{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "ALT";
      bind = [
        "$mod, RETURN, exec, alacritty"
        "$mod, D, exec, rofi -show drun"
        "$mod, Q, killactive,"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      input.kb_layout = "us";
      general = { gaps_in = 6; gaps_out = 12; border_size = 2; };
      decoration.rounding = 8;
    };
  };
}

