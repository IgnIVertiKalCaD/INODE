{ config, lib, pkgs, unstablepkgs, ... }:

{
  environment = {
    noXlibs = false;
    systemPackages = [
    ]
    ++ (with pkgs; [
      google-chrome      
      epiphany
      brillo
      postman
      prismlauncher
      s-tui
      cliphist
      mangohud
      rnote
      swappy
      easyeffects
      bottles
      wl-clipboard
      yarn
      rustup
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
      wireguard-tools
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
      rustc
      transmission_4-gtk
      heroic
      gamescope
      evince
      gnome-text-editor
      lm_sensors
    ])
    ++ (with unstablepkgs; [
      vesktop
      firefox
    ])
    ++ (with pkgs.cinnamon; [
      nemo-with-extensions
    ])
    ++ (with pkgs.gnome; [
      gnome-tweaks
      gnome-disk-utility
      eog
      gnome-music
    ])
    ++ (with pkgs.nodePackages; [
      nodejs
    ])
    ++ (with pkgs.obs-studio-plugins; [
      obs-vaapi
    ])
    ++ (with pkgs.qt6; [
      full
    ]);
  };
}
