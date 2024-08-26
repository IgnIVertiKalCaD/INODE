{ config, lib, pkgs, ... }:

{
  services = {
    xserver.enable = true;
    xserver.videoDrivers = [ ];
    xserver.excludePackages = [ pkgs.xterm ];
    xserver.displayManager.gdm.enable = false;
    xserver.desktopManager.gnome.enable = false;

    udisks2.enable = true;
    devmon.enable = true;
    gvfs.enable = true;

    fstrim.enable = true;
    openssh.enable = false;
    mysql.package = pkgs.mariadb;
    mysql.enable = true;
    redis.servers."" = { enable = true; };
    ntp.enable = true;
    gnome.core-utilities.enable = false;
    xserver.desktopManager.xterm.enable = false;
    dbus.enable = true;
    tailscale.enable = true;
    
    postgresql = { 
  	enable = true;
	package = pkgs.postgresql_16; 
    };
   
    #nginx.enable = true;
  };
}
