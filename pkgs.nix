{ config, lib, pkgs, unstablepkgs, ... }:

{
  environment.systemPackages = [
  ]
  ++ (with pkgs; [
#dev
    clang
    mold
openssl
pkg-config

    cliphist
    nix-index    
    mangohud
    vesktop
    rnote
    xwayland
    swappy
    easyeffects
    bottles
    wl-clipboard
    yarn
    rustup
    openssl
    binutils
    tailscale
    (callPackage ./mods/davinci/davinci-resolve-crack.nix { })
    (callPackage ./mods/zed-editor/zed-editor.nix { })
    (callPackage ./mods/niri/niri.nix { })
    nixpkgs-fmt
    amdgpu_top
    v4l-utils
    postman
    qemu_full
    baobab
    egl-wayland
    pavucontrol
    lact
    adoptopenjdk-jre-bin
    gimp
    wireguard-tools
    ffmpeg-full
    qpwgraph
    mpv
    bat
    killall
    tmux
    pipewire
    wget
    playerctl
    kitty
    wofi
    telegram-desktop
    btop
    grim
    coreutils-full
    libreoffice
    ungoogled-chromium
    obs-studio
    nettools
    libunwind
    xdg-desktop-portal-gnome
    teams-for-linux
    fontconfig
    git
    curl
    hyprpaper
    rustc
    transmission_4-gtk
    heroic
    lutris
    gamescope
    evince
    gnome-text-editor
    gnome-tweaks
    gnome-disk-utility
    eog
    lm_sensors
  ])
  ++ (with unstablepkgs; [
    firefox
    xwayland-satellite
  ])
  ++ (with pkgs.gnome; [
    gnome-music
  ])
  ++ (with pkgs.nodePackages; [
    nodejs
  ])
  ++ (with pkgs.qt6; [
    full
  ])
  ++ (with pkgs.jetbrains; [
  ]);
}
