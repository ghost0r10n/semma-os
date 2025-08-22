all: rebuild-home
rebuild-home:
	sudo nixos-rebuild switch --flake .#orion-home --impure
docker-image:
	nix build .#dockerImage
	docker load < ./result

docker-image-run:
	docker run --rm -it ghost0r10n/semma-os:0.1.0
