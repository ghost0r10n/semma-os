# Build CLI-only image
{ pkgs, nvimConfig, configVersion }:
let
  commonPkgs = import ../modules/common-pkgs.nix { inherit pkgs; };
  bootstrapScript = pkgs.writeShellScriptBin "nvim-bootstrap" ''
    set -euo pipefail

    lazy_dir="$HOME/.local/share/nvim/lazy"

    if [ ! -d "$lazy_dir" ]; then
      echo "[nvim-bootstrap] First run: bootstrapping lazy.nvim..."
      # Phase 1: start/quit once to let init.lua clone lazy.nvim
      nvim --headless "+q" || true

      # Phase 2: now :Lazy exists, do a full sync
      echo "[nvim-bootstrap] Installing plugins with :Lazy! sync..."
      nvim --headless "+Lazy! sync" +qa || true

      echo "[nvim-bootstrap] Bootstrap complete."
    fi
  '';
in
pkgs.dockerTools.buildImage {
  name = "ghost0r10n/semma-os";
  tag = configVersion;

  # Specify tools of the docker image (common + neovim)
  contents = commonPkgs ++ [
    pkgs.coreutils
    pkgs.findutils
    pkgs.gnugrep
    pkgs.gnused
    pkgs.zsh
    pkgs.bashInteractive
    nvimConfig
    bootstrapScript
    nvimConfig
  ];
  # Copy LazyVim into /root so `nvim` picks it up automatically
  extraCommands = ''
    mkdir -p root/.config
    cp -r ${nvimConfig} root/.config/nvim
    # just to be sure
    mkdir -p root/.local/share/nvim root/.cache/nvim root/.local/state/nvim
  '';
  config = {
    Cmd = [ "zsh" "-lc" "nvim-bootstrap; exec zsh" ];
    Env = [
      "LC_ALL=C.UTF-8"
      "EDITOR=nvim"
      "VISUAL=nvim"
      "PATH=/bin:/usr/local/bin:/usr/bin:/nix/var/nix/profiles/default/bin:${pkgs.jdk21}/lib/openjdk/bin"
      # optional: pick a default JDK visible to tools (Maven/Gradle)
      "JAVA_HOME=${pkgs.jdk21}/lib/openjdk"

    ];
    WorkingDir = "/root";
  };

}
