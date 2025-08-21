{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = { opacity = 0.95; padding = { x = 8; y = 8; }; };
      shell  = { program = "/run/current-system/sw/bin/zsh"; args = [ "-l" ]; };
      font = {
        normal = { family = "FiraCode Nerd Font"; style = "Regular"; };
        bold   = { family = "FiraCode Nerd Font"; style = "Bold"; };
        italic = { family = "FiraCode Nerd Font"; style = "Italic"; };
        size   = 11.0;
      };
    };
  };
}

