{ config, pkgs, ... }: {
  # Docker configuration for home-manager
  # This file configures Docker-related user settings
  
  home.packages = with pkgs; [
    docker-compose
  ];

  # Add any docker-specific aliases or configurations
  home.sessionVariables = {
    DOCKER_BUILDKIT = "1";
  };
}