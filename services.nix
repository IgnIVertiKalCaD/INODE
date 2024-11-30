{ config, lib, pkgs, ... }:

{
  services = {
    xserver.enable = false;
    xserver.excludePackages = [ pkgs.xterm ];
    xserver.desktopManager.xterm.enable = false;
    xserver.displayManager.gdm.enable = false;
    xserver.desktopManager.gnome.enable = false;

    gnome.gnome-keyring.enable = true;

    getty.autologinUser = "igni";

    logind = {
      extraConfig = "NAutoVTs=1 ReserveVT=2";
    };

    zapret = {
    	enable = true;
	params = [
"--dpi-desync=fake,disorder2" "--dpi-desync-fooling=md5sig" "--dpi-desync-repeats=3"
		  ];
		
    };

    udisks2.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;

    openssh.enable = false;

    ntp.enable = true;
    dbus.enable = true;
    zram-generator = { enable = true; settings = { }; };
  };
}
