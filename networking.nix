{ config, lib, pkgs, ... }:

{
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  #networking.proxy.default = "socks5h://localhost:1090";
  networking.proxy.noProxy = "127.0.0.1,localhost";
  systemd.services.systemd-networkd.enable = false;
  networking.networkmanager.enable = false;

  networking.hostName = "desktop";

  networking.enableIPv6 = true;

  networking.firewall = {
    enable = true;
  };

}
