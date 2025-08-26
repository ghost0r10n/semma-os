{
  # =========================
  # Semma-OS flake setup
  # =========================
  #
  # Author: Fabio Capocasale <fabio.capocasale@orionware.io>
  # GitHub: https://github.com/ghost0r10n/semma-os
  # License: MIT 
  #
  # Description:
  #   This flake defines a reusable NixOS configuration that can be built
  #   for multiple targets:
  #     - Host system (with hardware config)
  #     - Docker image (common packages only)
  #     - LiveUSB (generic system for portable usage)
  #     - Dev shell (common packages available anywhere)
  #
  # =========================
  description = "Semma OS, reusable nix os configuration for ghost0r10n";

  #VARS
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  inputs.home-manager.url = "github:nix-community/home-manager/release-25.05";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  inputs.lazyvim-starter.url = "github:LazyVim/starter";
  inputs.lazyvim-starter.flake = false; # <-- IMPORTANT

  outputs = { self, nixpkgs, lazyvim-starter, home-manager }:
    let
      configVersion = "0.1.0";
      system =
        "x86_64-linux"; # TODO understand how to make it work based on the current architecture
      pkgs = import nixpkgs {
        inherit system;
      }; # import package set for the current system
    in
    {

      # Main hosts configuration (Office and home)
      nixosConfigurations = {
        #------------------------------------ PHYSICAL SYSTEMS ------------------------------------
	#Office host
        orion-office = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit lazyvim-starter; };

          modules = [
            ./hosts/orion-office/default.nix
            ./modules/common.nix

            #Home manager as nixOs module
            home-manager.nixosModules.home-manager

            #Create a symlink for lazyvim
            {

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ghost0r10n = {
                # Required by HM; bump if HM warns about it
                home.stateVersion = "25.05";

                xdg.configFile."nvim".source = ./dotfiles/nvim;
                xdg.configFile."vpn".source = ./dotfiles/vpn;
                xdg.configFile."kanshi/config".text = ''
                    profile ultrawide {
                      output DP-1 mode 5120x1440@60Hz position 0,0 scale 1
                    }
                  '';

                  # Servizio systemd *utente* in Home Manager
                  systemd.user.services.kanshi = {
                    Unit = {
                      Description = "kanshi daemon";
                      After = [ "graphical-session.target" ];
                      PartOf = [ "graphical-session.target" ];
                    };
                    Service = {
                      Type = "simple";
                      ExecStart = "${pkgs.kanshi}/bin/kanshi -c %h/.config/kanshi/config";
                      Restart = "on-failure";
                    };
                    Install = {
                      WantedBy = [ "graphical-session.target" ];
                    };
                  };

                # (Optional) Home-managed per-user packages (keep light; OS handles most)
                home.packages = [ ];
              };

            }
          ];
        };


        #Home pc
        orion-home = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit lazyvim-starter; };

          modules = [
            ./hosts/orion-home/default.nix
            ./modules/common.nix

            #Home manager as nixOs module
            home-manager.nixosModules.home-manager

            #Create a symlink for lazyvim
            {

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ghost0r10n = {
                # Required by HM; bump if HM warns about it
                home.stateVersion = "25.05";

                xdg.configFile."nvim".source = ./dotfiles/nvim;
                xdg.configFile."vpn".source = ./dotfiles/vpn;

                # (Optional) Home-managed per-user packages (keep light; OS handles most)
                home.packages = [ ];
              };

            }
          ];
        };

        #------------------------------------------------------------------------------------------

        #------------------------------------ LIVE USB --------------------------------------------

        liveusb = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit lazyvim-starter; };

          modules = [ ./modules/common.nix ./images/liveusb-extra.nix ];
        };

        #------------------------------------------------------------------------------------------

        #------------------------------------ DOCKER ---------------------------------------------

        # TODO understand the system what implications has here
        packages.${system}.dockerImage = import ./images/docker-image.nix {
          inherit pkgs;
          configVersion = configVersion;
          nvimConfig = lazyvim-starter;
        };

        #------------------------------------------------------------------------------------------

        #------------------------------------ DEV SHELL -------------------------------------------

        #Handy for hacking in this repository
        devShells.${system}.default = pkgs.mkShell {
          #Uses the same common packages as the system
          buildInputs = (import ./modules/common-pkgs.nix { inherit pkgs; });
        };

        #------------------------------------------------------------------------------------------

      };
    };

}
