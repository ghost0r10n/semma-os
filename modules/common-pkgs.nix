{ pkgs, ... }:
with pkgs; [
  # Editors
  vim # primary editor (Shitty version)
  neovim # (https://www.youtube.com/watch?v=lPk_zyRKs1Q)
  nano # simple fallback editor

  # Version control
  git
  lazygit

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


  # Video
  kanshi

  #-------- DEV LIBS --------
  python3
  python3.pkgs.pip
  k9s
  jdt-language-server
  jdk17
  jdk21
  rustup
  maven
  nodejs_20
  xdg-utils
  go
  azure-cli
  kubectl
  kubelogin
  flutter
  vscodium
  clang
  cmake
  ninja
  docker
  lsof

  # Quarkus CLI
  quarkus

  #VPN STUFF
  #
  openconnect
  python3Packages.pycairo
  ninja
  meson
  cairo
  cairo.dev
  gtk3
  webkitgtk
  gobject-introspection
  pkg-config
  glib-networking
  cacert
  #--------------------------

  # --- Helpers LazyVim commonly expects ---
  ripgrep # :Telescope live_grep / builtin grep
  fd # faster file-finder (used by telescope)

  python3Packages.pynvim # python client for nvim (provider)
  gcc # compile treesitter parsers, LSPs, etc.
  gnumake # build tools some plugins expect
  unzip # already in common, but harmless here too

  #Let's fuzzy find this bitch
  fzf

  #audio
  pavucontrol
]
