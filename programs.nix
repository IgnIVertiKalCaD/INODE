{ config, lib, pkgs, ... }:

{
  programs = {
    steam = { enable = true; };
    dconf = { enable = true; };
    file-roller = { enable = true; };
    fish = { enable = true; };
    gamemode = { enable = true; };
    git = { enable = true; };
    tmux = { enable = true; };

    nix-ld = { enable = true; };
    nix-ld.libraries = with pkgs; [
      zlib
      libgcc
    ];
  };

}
