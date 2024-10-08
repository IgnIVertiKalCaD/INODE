{ config, lib, pkgs, unstablepkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;

    extraPackages = with unstablepkgs; [
      mesa
      intel-media-driver
      intel-ocl
      vpl-gpu-rt
      libvdpau-va-gl
      #intel-vaapi-driver
    ];
  };
}
