all: rebuild-home
rebuild-home:
	sudo nixos-rebuild switch --flake .#orion-home --impure
