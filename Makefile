rebuild:
	cat /etc/hostname && sudo nixos-rebuild switch --flake .#$1
