# ==============================================
# Common packages (minimal defaults)
# ==============================================
# One list used by:
#  - Host system (environment.systemPackages)
#  - Docker image (images/docker-image.nix)
#  - Dev shell (flake devShell)
#
# Keep this lean; we can add more as we go.
# ==============================================

{ pkgs }:
with pkgs; [
  # Editors
  vim            # primary editor (Shitty version)
  neovim     	 # (https://www.youtube.com/watch?v=lPk_zyRKs1Q)
  nano           # simple fallback editor

  # Version control
  git

  # Networking & transfers
  curl
  wget

  # Monitoring & basics
  htop
  tree

  # Shell & terminal
  zsh
  tmux

  # Archives
  unzip

  # Data wrangling
  jq

  # --- Helpers LazyVim commonly expects ---
  ripgrep                 # :Telescope live_grep / builtin grep
  fd                      # faster file-finder (used by telescope)
  nodejs                  # node provider (treesitter parsers, some plugins)
  python3                 # python provider
  python3Packages.pynvim  # python client for nvim (provider)
  gcc                     # compile treesitter parsers, LSPs, etc.
  gnumake                 # build tools some plugins expect
  unzip                   # already in common, but harmless here too
]

