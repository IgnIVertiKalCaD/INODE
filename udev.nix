{ config, lib, pkgs, unstablepkgs, ... }:

{
  services.udev.extraRules = ''
  '';
}
