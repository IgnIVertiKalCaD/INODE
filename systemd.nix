{ config, lib, pkgs, ... }:

let
  niri = pkgs.callPackage ./mods/niri/niri.nix { };
in
{
  systemd = {
    #services.nix-daemon.environment = {
    #    https_proxy = "socks5h://localhost:1090";
    #    all_proxy = "socks5h://localhost:1090";
    #    http_proxy = "socks5h://localhost:1090"; 
    #};

    extraConfig = "DefaultTimeoutStopSec=10s";
    services = {
      lact-daemon = {
        enable = true;
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.lact}/bin/lact daemon";
        };
      };
    };

    user.services = {
      niri-session = {
        description = "autostart niri-session";
        wantedBy = [ "default.target" ];
        serviceConfig = {
          ExecStart = "${niri}/bin/niri-session";
          Restart = "always";
          RestartSec = 5;
        };
      };

      polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };

      shadowsocks-local = {
        enable = true;
        description = "RF sasat";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "multi-user.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.shadowsocks-rust}/bin/sslocal -c /etc/shadowsocks/ss-client.json";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };

    };
  };
}
