# Semma-OS 🐧💀

> _“Yet another Nix flake, but this time it’s mine.
> If it breaks, it’s your fault. If it works, I did it on purpose.”_

Semma-OS is a **reusable NixOS configuration** that I ([@ghost0r10n](https://github.com/ghost0r10n)) built so I can stop copy-pasting dotfiles like a caveman. It runs on my host, my Docker images, and even my LiveUSBs — because why should my environment ever be consistent when I can make Nix do the work instead?

---

## ✨ Features

- **Multi-target config**:
  - 🖥️ Host (with hardware config)
  - 🐳 Docker image (headless dev)
  - 💾 LiveUSB (plug anywhere, annoy sysadmins)
  - 🛠️ Dev shells (because I _will_ forget which JDK I’m on)

- **LazyVim out of the box** (neovim + mason auto-installs everything, so yes, it will download half the internet the first time you open `nvim`)
- **Hyprland** with:
  - 🔥 faster animations than your patience
  - 🖱️ directional focus (hjkl + arrows)
  - 🖼️ wallpapers baked into the flake (portable pretty pixels)

- **Waybar** (starts on boot, unless you break it again)
- **Zsh + oh-my-zsh** (because default bash hurts my feelings)
- **Fonts**: Nerd Fonts included, because squares are ugly
- **Dev toolchains**:
  - Java 17 + 21 (choose your poison)
  - Python 3.10
  - Rust (rustup)
  - Go (gopls included)
  - Maven (yes, it’s still relevant apparently)

---

## 🚀 Getting started

### Host install

```bash
sudo nixos-rebuild switch --flake .#orion-home
```

⚠️ _If it fails, it’s probably because you edited `configuration.nix` at 3AM again._

### Docker image

```bash
nix build .#dockerImage
docker load < result
docker run --rm -it fabio/nix-common:0.1.0
```

👉 First run takes a while because Mason downloads the universe. Don’t @ me.

### LiveUSB

```bash
nixos-rebuild build --flake .#liveusb
```

Then burn the ISO like it’s 2009.

### Dev shells

```bash
nix develop .#java17   # for legacy enterprisey code
nix develop .#java21   # for the slightly less legacy code
nix develop .#rust     # fearless concurrency (and fearless compiler errors)
nix develop .#go       # minimal tooling, maximal bikeshedding
```

---

## 🖼️ Wallpapers

Stored in `assets/wallpapers/` and baked into the flake.
Yes, they follow me into Docker. No, you can’t escape them.

---

## 🔧 FAQ (aka “Things you’ll forget in 2 weeks”)

**Q: Why is `:Lazy! sync` broken?**
A: Because you didn’t open Neovim once to bootstrap Lazy.nvim. Open it. Quit. Then sync. It’s in the logs, genius.

**Q: Why do I have two Waybars?**
A: Because you enabled it in both Hyprland `exec-once` **and** systemd. Pick one. Seriously.

**Q: Why does Hyprland say `XDG_RUNTIME_DIR not set`?**
A: Stop running it as root.

**Q: Can I run this on Ubuntu/Debian?**
A: Technically yes, but why? That’s like asking if you can run Gentoo inside Windows ME.

---

## 📂 Repo structure

```
flake.nix              # entrypoint
hosts/
  orion-home/          # my main machine config
modules/
  common.nix           # shared system options
  common-pkgs.nix      # CLI packages everywhere
  desktop-pkgs.nix     # GUI-only stuff
images/
  docker-image.nix     # Docker image builder
  liveusb-extra.nix    # tweaks for LiveUSB
home/
  ghost0r10n/          # Home Manager configs
    hyprland.nix
    waybar.nix
    zsh-ohmyzsh.nix
    ...
assets/
  wallpapers/          # wallpapers baked into the flake
```

---

## 📝 License

MIT. Do whatever you want, just don’t blame me when it eats your homework.
