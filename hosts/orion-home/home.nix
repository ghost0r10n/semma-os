{ pkgs, ... }: {
  imports = [ ../../home/ghost0r10n/home.nix ];

  # Copy wallpaper to nix store and set it for Hyprland
  home.file."wallpaper.jpg".source = ./wallpaper.jpg;
  
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "${pkgs.swaybg}/bin/swaybg -i ~/wallpaper.jpg -m fill"
    ];
  };
}
