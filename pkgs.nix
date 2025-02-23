{ config, lib, pkgs, unstablepkgs, ... }:

{
  environment = {
    systemPackages = [
    ]
    ++ (with pkgs; [
      keepassxc
      vesktop
      sing-box
      tor-browser
      exodus
      keybase-gui
      keybase
      nix-index
      gcc
      devbox
      teamspeak_client
      shadowsocks-rust
      google-chrome
      brillo
      postman
      prismlauncher
      cliphist
      mangohud
      rnote
      swappy
      easyeffects
      bottles
      wl-clipboard
      yarn
      binutils
      filezilla
      (callPackage ./mods/davinci/davinci-resolve-crack.nix { })
      #(callPackage ./mods/zed-editor/zed-editor.nix { })
      (callPackage ./mods/niri/niri.nix { })
      (callPackage ./mods/xwayland-satellite.nix { })
      nixpkgs-fmt
      v4l-utils
      postman
      pavucontrol
      gimp
      ffmpeg-full
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
      onlyoffice-bin_latest
      obs-studio
      nettools
      libunwind
      xdg-desktop-portal-gnome
      teams-for-linux
      git
      curl
      hyprpaper
      transmission_4-gtk
      heroic
      gamescope
      evince
      gnome-text-editor
      lm_sensors
      gnome-tweaks
      gnome-disk-utility
      eog
      gnome-music
      nemo-with-extensions
      webstorm
      rustrover
    ])
    ++ (with unstablepkgs; [
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
