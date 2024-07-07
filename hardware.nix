{ config, lib, pkgs, unstablepkgs, ... }:

{
  hardware.amdgpu.amdvlk.enable = false;
  hardware.cpu.amd.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with unstablepkgs; [
      mesa
      rocmPackages.clr.icd
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
  };
}
