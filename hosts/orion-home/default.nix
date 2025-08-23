{ config, pkgs, ... }:

{

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;
    nvidia.open = true; # Use the new open-source module for Turing GPUs
    # Optionally choose driver branch:
    # nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  };
  # Enable experimental features (flakes and nix command)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
    ../../modules/common.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "orion-home"; # Define your hostname.
  networking.networkmanager.enable = true;

  networking.extraHosts = ''
    127.0.0.1 orion-home localhost
  '';

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.ghost0r10n = {
    isNormalUser = true;
    description = "ghost0r10n";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs;
      [
        kdePackages.kate
        #  thunderbird
      ];
  };

  services.greetd = {
    enable = true;

    settings = {
      terminal.vt = 1;

      default_session = {
        user = "ghost0r10n";
        command = "Hyprland";
      };
    };
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "ghost0r10n";

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ bluez blueman ];

  system.stateVersion = "25.05"; # Did you read the comment?

  # HOME MANAGER SETUP
  home-manager.users.ghost0r10n = import ./home.nix;

  #Bluetooth settings
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez;
    settings = {
      General = {
        Name = "ghost0r10n-home-pc";
        ControllerMode = "dual";
        AutoEnable = "true";
        Experimental = "true";
      };
    };
  };
  services.blueman.enable = true;
}
