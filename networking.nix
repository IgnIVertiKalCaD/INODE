{ config, lib, pkgs, ... }:

{
  networking.nameservers = [ "8.8.4.4" "8.8.8.8" "1.1.1.1" ];

  networking.hostName = "laptop";

  networking.firewall.enable = false;
  networking.nftables.enable = true;

  networking.wireless = {
    enable = true;
    userControlled = {
      enable = true;
    };
    networks."RT-GPON-EEEC".psk = "s8wq5vhR";
    networks."V".psk = "275byyyy";
    networks."tplinkdom".psk = "9187582811";
  };

}
