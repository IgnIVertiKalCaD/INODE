{ config, lib, pkgs, unstablepkgs, ... }:

{
  environment = {
    noXlibs = false;
    systemPackages = [
    ]
    ++ (with pkgs; [
      latest.firefox-nightly-bin
      rustrover
      teamspeak_client  
      webstorm
      micro
      btop
      openvpn
      tor-browser
      shadowsocks-rust
      google-chrome
      epiphany
      brillo
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
#      full
    ]);
  };
}
