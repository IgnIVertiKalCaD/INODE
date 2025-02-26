{ config, lib, pkgs, ... }:

{
  services = {
    syncthing = {
      enable = true;
      systemService = false;
      user = "igni";
      group = "users";
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

    tailscale = {
      enable = true;
      extraDaemonFlags = [
      ];
    };

    getty.autologinUser = "igni";

    logind = {
      extraConfig = "NAutoVTs=1 ReserveVT=2";
    };

    postgresql = {
      enable = false;
      ensureDatabases = [ "mydatabase" ];
    };

    mysql = {
      enable = false;
      package = pkgs.mariadb;
    };

    redis.servers."" = {
      enable = false;
    };

    udisks2.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    fstrim.enable = true;

    openssh.enable = false;

    ntp.enable = true;
    dbus.enable = true;
    zram-generator = { enable = true; settings = { }; };

    mediamtx = {
      enable = true;
      settings = {

        logLevel = "info";
        logDestinations = [ "stdout" ];
        logFile = "mediamtx.log";
        readTimeout = "10s";
        writeTimeout = "10s";
        writeQueueSize = 512;
        udpMaxPayloadSize = 1420;

        runOnConnect = null;
        runOnConnectRestart = true;
        runOnDisconnect = null;

        authMethod = "internal";
        authInternalUsers = [
          {
            user = "any";
            pass = null;
            ips = [ ];
            permissions = [
              { action = "publish"; path = null; }
              { action = "read"; path = null; }
              { action = "playback"; path = null; }
            ];
          }
        ];

        authHTTPAddress = null;
        authHTTPExclude = [
          { action = "api"; }
          { action = "metrics"; }
          { action = "pprof"; }
        ];

        #authJWTJWKS = null;
        #authJWTClaimKey = "mediamtx_permissions";

        webrtc = true;
        webrtcAddress = ":8889";
        webrtcEncryption = false;
        webrtcServerKey = "server.key";
        webrtcServerCert = "server.crt";
        webrtcAllowOrigin = "*";
        webrtcTrustedProxies = [ "100.64.0.3" ];
        webrtcLocalUDPAddress = ":8189";
        #webrtcLocalTCPAddress = ":8189";
        webrtcIPsFromInterfaces = true;
        webrtcIPsFromInterfacesList = [ ];
        webrtcAdditionalHosts = [ "100.64.0.3" ];
        webrtcICEServers2 = [ ];
        #webrtcHandshakeTimeout = "10s";
        #webrtcTrackGatherTimeout = "2s";

        paths = {
          all_others = { };
        };

      };
    };
  };
}
