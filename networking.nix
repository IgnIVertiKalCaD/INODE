{ config, lib, pkgs, ... }:

{
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  #networking.proxy.default = "socks5h://localhost:1090";
  networking.proxy.noProxy = "127.0.0.1,localhost";

  systemd.services.systemd-networkd.enable = false;
  networking.networkmanager.enable = false;

  networking.hostName = "desktop";

  networking.nftables.enable = true;

  networking.enableIPv6 = false;
  networking.firewall.enable = false;
}
