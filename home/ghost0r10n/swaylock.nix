{ pkgs, ... }: 
let
  welcomeScript = pkgs.writeShellScript "welcome-master" ''
    ${pkgs.libnotify}/bin/notify-send -t 3000 -u normal "🔓 Access Granted" "Welcome back, master"
  '';
in {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      # Background and effects - instant blur
      screenshots = true;
      effect-blur = "10x5";
      effect-vignette = "0.2:0.8";
      fade-in = 0;
      grace = 0;
      
      # Clock
      clock = true;
      datestr = "%A, %d %B %Y";  
      timestr = "%H:%M";
      font = "FiraCode Nerd Font";
      font-size = 32;
      text-color = "b794f6";
      
      # Transparent circle with lock icon
      indicator = true;
      indicator-radius = 150;
      indicator-thickness = 10;
      
      # TRANSPARENT CIRCLE with purple typing feedback
      inside-color = "00000000";        # Completely transparent
      ring-color = "b794f655";          # Subtle purple ring 
      line-color = "00000000";          # Transparent line
      key-hl-color = "b794f6ff";        # PURPLE when typing!
      separator-color = "00000000";     # Transparent separator
      
      # Password state colors - purple theme
      inside-wrong-color = "00000000";   # Stay transparent
      ring-wrong-color = "ff0000";       # RED ring when wrong
      text-wrong-color = "ffffff";       # WHITE text
      
      inside-clear-color = "00000000";   # Stay transparent
      ring-clear-color = "b794f6";       # PURPLE ring clearing
      text-clear-color = "b794f6";       # PURPLE text
      
      inside-ver-color = "00000000";     # Stay transparent  
      ring-ver-color = "b794f6";         # PURPLE ring verifying
      text-ver-color = "b794f6";         # PURPLE text
      
      # Show typing feedback
      show-failed-attempts = true;
      
      # Hide layout crap
      show-keyboard-layout = false;
      hide-keyboard-layout = true;
      disable-caps-lock-text = true;
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = "00000000";
    };
  };
  
  # Simple notification on desktop startup (simulates unlock welcome)
  home.file.".local/bin/welcome-on-unlock" = {
    text = ''
      #!/bin/bash
      # Watch for swaylock process ending and show notification
      while true; do
        if pgrep swaylock > /dev/null; then
          # Wait for swaylock to exit
          while pgrep swaylock > /dev/null; do
            sleep 0.5
          done
          # Show notification after unlock
          ${welcomeScript}
          sleep 5  # Prevent spam
        fi
        sleep 1
      done
    '';
    executable = true;
  };
}