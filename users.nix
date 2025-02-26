{ config, lib, pkgs, unstablepkgs, ... }:

{
  users.mutableUsers = true;
  users.groups.video = { };
  users.groups.wheel = { };

  users.users.igni = {
    isNormalUser = true;
    linger = true;
    home = "/home/igni";
    extraGroups = [ "wheel" "video" "audio" "kvm" "input" ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };
}
