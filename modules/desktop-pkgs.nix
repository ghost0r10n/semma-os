{ pkgs, ... }:
with pkgs; [
  # Hyprland ecosystem
  hyprland hyprpaper hypridle hyprlock
  waybar rofi-wayland wlogout

  # Wayland helpers
  wl-clipboard grim slurp swappy 

  # Portals (also configured in system)
  xdg-desktop-portal-gtk xdg-desktop-portal-hyprland

  # Terminal
  alacritty
]

