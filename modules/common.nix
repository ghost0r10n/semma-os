{ config, pkgs, ... }: {
  # Nix CLI + flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Basic locale/time
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";

  # User shell
  programs.zsh.enable = true;
  users.users.ghost0r10n.shell = pkgs.zsh;
  users.users.ghost0r10n.extraGroups = [ "docker" ];

  # Neovim globally + aliases
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Desktop stack (Wayland/Hyprland essentials, audio, portals)
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals =
    [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.dbus.enable = true;
  security.polkit.enable = true;

  hardware.graphics.enable = true;

  # Nerd Fonts (new split namespace)
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  # Pull in GUI/desktop packages for hosts that import this module
  environment.sessionVariables.COPILOT_NODE_COMMAND =
    "${pkgs.nodejs_20}/bin/node";
  environment.sessionVariables.GBM_BACKEND = "nvidia-drm";
  environment.sessionVariables.__GLX_VENDOR_LIBRARY_NAME = "nvidia";
  environment.sessionVariables.__GL_GSYNC_ALLOWED = "0";
  environment.sessionVariables.__GL_VRR_ALLOWED = "0";

  environment.systemPackages = (import ./common-pkgs.nix { inherit pkgs; })
    ++ (import ./desktop-pkgs.nix { inherit pkgs; });

  # NixOS state baseline
  system.stateVersion = "25.05";
}
