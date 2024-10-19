{ config, lib, pkgs, ... }:

{
  services = {
    xserver.enable = false;
    xserver.excludePackages = [ pkgs.xterm ];
    xserver.desktopManager.xterm.enable = false;
    xserver.displayManager.gdm.enable = false;
    xserver.desktopManager.gnome.enable = false;

    gnome.gnome-keyring.enable = true;

    udisks2.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;

    openssh.enable = false;

    #mysql.package = pkgs.mariadb;
    #mysql.enable = true;
    #redis.servers."" = { enable = true; };
    ntp.enable = true;
    gnome.core-utilities.enable = false;
    dbus.enable = true;
    zram-generator = { enable = true; settings = { }; };

    postgresql = {
      enable = false;
      package = pkgs.postgresql_16;
    };
  };
}
