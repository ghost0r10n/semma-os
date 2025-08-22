{pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = [{

        #-------- POSITION & SIZE --------
        layer = "top";
        position = "top";
        height = 25;
        margin = "6 6 0 6";
        spacing = 10;
        #---------------------------------
       
        #-------- MODULES -------- 
        modules-left = [ "hyprland/workspaces" "window"];
        modules-center= [ "clock" ];
        modules-right= [ "cpu" "memory" "network" "pulseaudio" "battery" "tray" ];
        #--------------------------

        
        #-------- LEFT MODULES --------
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "hyprctl dispatch workspace {name}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          sort-by-number = true;
          active-only = false;
          all-outputs = true;
        };
        "window" = { max-lenght = 60; icon = true;};
        #------------------------------

        #-------- CENTER MODULES --------
        "clock" = {
          format = "{:%a %d %b  %H:%M}";      # e.g. Mon 25 Aug  14:32
          tooltip = false;
          # optional: full info on hover
          # tooltip-format = "{:%A, %d %B %Y  %H:%M:%S}";
        };
        #--------------------------------
        
        #-------- LEFT MODULES --------
        "cpu"={
          format = " {usage}%";
          tooltip = false;
        };
        "memory"={ 
          format = " {used:0.1f}G";
          tooltip = false;
        };
        "network" = {
        format-wifi = "  {essid} {signalStrength}%";
        format-ethernet = "  {ifname}";
        format-disconnected = "  down";
        tooltip = false;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = " mute";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
          icons = { "default" = [ "" "" ]; };
        };

        "battery" = {
          format = "{capacity}%";
          format-full = " 100%";
          tooltip = false;
        };
        "tray" = { spacing = 8; };
        #------------------------------

        
      }];


      
      #-------- STYLE --------
      # Catppuccin-ish minimal theme (works with Nerd Fonts)
      style = ''
        * { font-family: "FiraCode Nerd Font", "JetBrainsMono Nerd Font", sans-serif; font-size: 12px; }
        window#waybar {
          background: rgba(17, 19, 24, 0.85);
          border-radius: 10px;
          color: #e6e9ef;
          padding: 6px 10px;
        }
        #workspaces button {
          padding: 0 8px; margin: 0 4px; color: #cdd6f4; background: transparent; border: 1px solid transparent;
        }
        #workspaces button.active {
          color: #111318; background: #a6e3a1; border-color: #a6e3a1;
        }
        #workspaces button.urgent { background: #f38ba8; color: #111318; }
        #window { color: #cdd6f4; }
        #pulseaudio, #network, #battery, #cpu, #memory, #clock, #tray {
          padding: 0 10px; border-radius: 8px; background: rgba(42, 46, 55, 0.6); margin: 0 4px;
        }
      '';
      #-----------------------

  };
}
