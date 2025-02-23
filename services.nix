{ config, lib, pkgs, ... }:

{
  services = {
    xserver.enable = false;
    xserver.excludePackages = [ pkgs.xterm ];
    xserver.desktopManager.xterm.enable = false;
    xserver.displayManager.gdm.enable = false;
    xserver.desktopManager.gnome.enable = false;

    gnome.gnome-keyring.enable = true;

    tailscale.enable = true;

    getty.autologinUser = "igni";

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
    logind = {
      extraConfig = "NAutoVTs=1 ReserveVT=2";
    };

    udisks2.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;

    openssh.enable = false;

    ntp.enable = true;
    gnome.core-utilities.enable = false;
    dbus.enable = true;
  };
}
