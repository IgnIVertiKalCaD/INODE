{ config, lib, pkgs, unstablepkgs, ... }:

{
  environment = {
    systemPackages = [
    ]
    ++ (with pkgs; [
      nautilus
      musicpod
      keepassxc
      vscodium
      btop
      devbox
      vesktop
      sing-geoip
      sing-box
      tor-browser
      exodus
      keybase-gui
      keybase
      nix-index
      resources
      rustrover
      teamspeak5_client
      google-chrome
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
      transmission_4-gtk
      heroic
      evince
      gnome-text-editor
      gnome-disk-utility
      swayimg
      nemo-with-extensions
      firefox
    ])
    ++ (with unstablepkgs; [
      telegram-desktop
      webstorm
    ])
    ++ (with pkgs.nodePackages; [
      nodejs
    ])
    ++ (with pkgs.obs-studio-plugins; [
      obs-vaapi
    ]);
  };
}
