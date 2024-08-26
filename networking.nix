{ config, lib, pkgs, ... }:

{
  networking.nameservers = [ "1.1.1.1" "9.9.9.9" "8.8.8.8"];
  systemd.services.systemd-networkd.enable = false;
  networking.networkmanager.enable = false;

  networking.hostName = "laptop";

  networking.wireless.enable = true;
}
