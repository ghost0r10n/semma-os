{pkgs, ...}:
{
environment.systemPackages = (import ./common-pkgs.nix { inherit pkgs; });
# Your other system options...
nix.settings.experimental-features = [ "nix-command" "flakes" ];
time.timeZone = "Europe/Rome";
programs.neovim = {
	enable=true;
	defaultEditor=true;
	viAlias = true;

};
}
