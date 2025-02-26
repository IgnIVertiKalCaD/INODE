{ config, lib, pkgs, ... }:

{
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    TERM = "xterm";
    XCURSOR_SIZE = "24";
    XDG_CURRENT_DESKTOP = "sway";
    NIXOS_OZONE_WL = "1";

    VDPAU_DRIVER = "radeonsi";
    LIBVA_DRIVER_NAME = "radeonsi";
  };
}
