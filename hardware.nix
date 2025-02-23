{ config, lib, pkgs, unstablepkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;

  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      mesa
      intel-media-driver
      intel-ocl
      vpl-gpu-rt
      libvdpau-va-gl
    ];
  };
}
