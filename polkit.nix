{ config, lib, pkgs, unstablepkgs, ... }:

{
  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
