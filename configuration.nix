{ config, lib, pkgs, ... }:

let
  unstablepkgs = import <unstable> { };
in
{
  nix = {
    nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
      "nixos-config=/etc/nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
      "nixpkgs-overlays=/etc/nixos/overlays"
    ];
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      #efiSysMountPoint = "/boot/EFI"; # ← use the same mount point here.
    };
  };

  _module.args = {
    unstablepkgs = unstablepkgs;
  };

  imports =
    [
      ./hardware-configuration.nix
      ./pkgs.nix
      ./boot.nix
      ./environment.nix
      ./hardware.nix
      ./systemd.nix
      ./sound.nix
      ./networking.nix
      ./programs.nix
      ./udev.nix
      ./services.nix
      ./users.nix
      ./fonts.nix
      ./polkit.nix
      ./laptop.nix
      ./virtualisation.nix
    ];


  nixpkgs.overlays = [ (import ./overlays/jetbrains.nix) (import ./overlays/firefox-overlay.nix) ];

  nix.settings.trusted-users = [ "root" "igni" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  #programs.nix-ld.dev.enable = true;

  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  #virtualisation.libvirtd.enable = true;
  #programs.virt-manager.enable = true;

  system.stateVersion = "23.11";
}
