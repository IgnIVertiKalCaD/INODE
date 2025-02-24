{ config, lib, pkgs, unstablepkgs, ... }:

let
  sriov-modules = builtins.fetchGit {
    url = "https://github.com/cyberus-technology/nixos-sriov";
    ref = "main";
  };
in
{
  imports = [
    "${sriov-modules}/sriov.nix"
  ];

  specialisation.vbox-kvm-sriov.configuration = {
    virtualisation.cyberus.intel-graphics-sriov.enable = true;
  };

  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
}
