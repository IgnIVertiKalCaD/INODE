{ config, lib, pkgs, unstablepkgs, ... }:

{
  environment = {
    systemPackages = [
    ]
    ++ (with pkgs; [
vesktop
sing-box
tor-browser 
exodus 
keybase-gui 
keybase 
nix-index
gcc
      resources
      rustrover
      teamspeak_client
      micro
      btop
      openvpn
      shadowsocks-rust
      google-chrome
      epiphany
      postman
      prismlauncher
      cliphist
      mangohud
      rnote
      swappy
      easyeffects
      lact
      bottles
      wl-clipboard
      yarn
      rustup
      binutils
      (callPackage ./mods/davinci/davinci-resolve-crack.nix { })
      (callPackage ./mods/niri/niri.nix { })
      (callPackage ./mods/xwayland-satellite.nix { })
      nixpkgs-fmt
      v4l-utils
      pavucontrol
      gimp
      ffmpeg-full
      mpv
      bat
      killall
      wget
      playerctl
      kitty
      wofi
      coreutils-full
      onlyoffice-bin_latest
      obs-studio
      nettools
      xdg-desktop-portal-gnome
      curl
      mpvpaper
      rustc
      transmission_4-gtk
      heroic
      evince
      gnome-text-editor
      lm_sensors
      gnome-tweaks
      gnome-disk-utility
      eog
      gnome-music
      nemo-with-extensions
])
    ++ (with unstablepkgs; [
      telegram-desktop
      webstorm
      firefox
    ])
    ++ (with pkgs.nodePackages; [
      nodejs
    ])
    ++ (with pkgs.obs-studio-plugins; [
      obs-vaapi
    ]);
  };
}
