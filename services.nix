{ config, lib, pkgs, ... }:

{
  services = {
    syncthing = { 
	enable = true;
	systemService = false;
	user = "igni";
    group   = "users";
	dataDir = "/home/igni";	
    configDir = "/home/igni/.config/syncthing";

    settings = {
        gui = {
        user = "igni-sync";
         password = "9838de7d-7f02-4046-9f38-2349b8fc61c9";
          theme = "black";
        };
        devices = {
        	smartphone = {
        	  id = "7CFNTQM-IMTJBHJ-3UWRDIU-ZGQJFR6-VCXZ3NB-XUH3KZO-N52ITXR-LAIYUAU";
        	};
        }; 
		folders = {
      			"Documents" = {
        			path = "/home/igni/Documents";
      			};
		};
 	};
    };
    
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
