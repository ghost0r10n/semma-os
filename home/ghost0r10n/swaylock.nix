{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      screenshots = true;
      clock = true;
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 7;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      ring-color = "a6e3a1";
      key-hl-color = "a6e3a1";
      line-color = "00000000";
      inside-color = "00000088";
      separator-color = "00000000";
      grace = 2;
      grace-no-mouse = true;
      grace-no-touch = true;
      datestr = "%A, %d %B %Y";
      timestr = "%H:%M";
      fade-in = 0.2;
      font = "FiraCode Nerd Font";
      font-size = 24;
      text-color = "cad3f5";
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = "cad3f5";
      line-uses-ring = false;
      ring-uses-inside = true;
      inside-wrong-color = "f38ba8";
      ring-wrong-color = "f38ba8";
      inside-clear-color = "f9e2af";
      ring-clear-color = "f9e2af";
      inside-ver-color = "89b4fa";
      ring-ver-color = "89b4fa";
      text-wrong-color = "f38ba8";
      text-ver-color = "89b4fa";
      text-clear-color = "f9e2af";
      bs-hl-color = "f38ba8";
      caps-lock-key-hl-color = "f9e2af";
      caps-lock-bs-hl-color = "f38ba8";
      disable-caps-lock-text = true;
      text-caps-lock-color = "f9e2af";
    };
  };
}