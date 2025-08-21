{pkgs, ...}:
{
environment.systemPackages = (import ./common-pkgs.nix { inherit pkgs; });

 fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ]; #BITCH ASS FONTS (2 HOURS TO MAKE THEM WORK)

nix.settings.experimental-features = [ "nix-command" "flakes" ];
time.timeZone = "Europe/Rome";
  programs.neovim = {
    enable=true;
    defaultEditor=true;
    viAlias = true;

  };

}
