{ config, pkgs, lib, lazyvim-starter, ... }: {

  networking.networkmanager.enable = true;
  hardware.enableAllFirmware = true;

  environment.etc."skel/.config/nvim".source = lazyvim-starter;

  system.activationScripts.lazyvimForRoot = lib.stringAfter [ "users" ]
    "	mkdir -p /root/.config\n	if [ ! -e /root/.config/nvim ]; then\n		ln -sfn ${lazyvim-starter} /root/.config/nvim\n	fi\n";

}
