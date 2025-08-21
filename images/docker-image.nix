#Build CLI-only image
{pkgs, nvimConfig, configVersion};

let 
	commongPkgs = import ../modules/common-pkgs.nix {inherit pkgs;};
in
pkgs.dockerTools.buildImage {
	name="ghost0r10n/semma-os";
	tag = configVersion;

	# Specify tools of the docker image (common + neovim)
	contents = commonPkgs ++ [ pkgs.bashInteractive nvimConfig ];
	
	config = {
		Cmd = ["zsh"];
		Env = ["LC_ALL=C.UTF-8" ];
		WorkingDir = "/root";
	};
  # Copy LazyVim into /root so `nvim` picks it up automatically
    extraCommands = ''
	    mkdir -p root/.config
	    cp -r ${nvimConfig} root/.config/nvim
    '';
}
