{ pkgs, ... }: {
  home.stateVersion = "25.05";
  imports = [ ./alacritty.nix ./hyprland.nix ./zsh-ohmyzsh.nix ./waybar.nix ];
}
