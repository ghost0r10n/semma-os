{ pkgs, ... }:
with pkgs; [
  # Editors
  obsidian
  vim # primary editor (Shitty version)
  neovim # (https://www.youtube.com/watch?v=lPk_zyRKs1Q)
  nano # simple fallback editor

  # Version control
  git
  lazygit
  lazydocker

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

  # Database tools
  mongodb-compass

  # Video
  kanshi

  showmethekey

  #-------- DEV LIBS --------
  postgresql
  dbeaver-bin
  python3
  python3.pkgs.pip
  k9s
  jdt-language-server
  jdk17
  jdk21
  rustup
  maven
  nodejs_22
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
  gcc
  stdenv.cc.cc.lib
  glibc
  chromium
  zlib


  # Quarkus CLI
  quarkus

  #VPN STUFF
  #
  openconnect
  wireguard-tools
  wireguard-ui
  tailscale
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

  #messaging
  signal-desktop
  steam
  spotify
]
