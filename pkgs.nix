{ config, lib, pkgs, unstablepkgs, ... }:

{
  environment = {
    systemPackages = [
    ]
    ++ (with pkgs; [
      musicpod
      keepassxc
      vesktop
      tor-browser
      exodus
      keybase-gui
      keybase
      nix-index
      devbox
      teamspeak5_client
      yt-dlp
#      zed-editor
      google-chrome
      brillo
      prismlauncher
      cliphist
      rnote
      swappy
      easyeffects
      bottles
      wl-clipboard
      yarn
      binutils
      (callPackage ./mods/davinci/davinci-resolve-crack.nix { })
      (callPackage ./mods/sing-box.nix { })
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
