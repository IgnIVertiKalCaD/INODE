{ config, lib, pkgs, ... }:

{
  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
  systemd.services.systemd-networkd.enable = false;
  networking.networkmanager.enable = false;

  networking.hostName = "desktop";

  networking.wg-quick.interfaces.wg0.configFile = "/etc/wireguard/wg0.conf";
  networking.wg-quick.interfaces.wg0.autostart = false;

  networking.wg-quick.interfaces.wg1.configFile = "/etc/wireguard/wg1.conf";
  networking.wg-quick.interfaces.wg1.autostart = false;
}
