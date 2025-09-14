{ pkgs, ... }: {
  home.stateVersion = "25.05";
  imports = [
    ./alacritty.nix
    ./hyprland.nix
    ./rofi.nix
    ./swaylock.nix
    ./zsh-ohmyzsh.nix
    ./waybar.nix
    ./tmux.nix
  ];
}
