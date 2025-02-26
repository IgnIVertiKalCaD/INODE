{ config, lib, pkgs, unstablepkgs, ... }:

{
  hardware.amdgpu.amdvlk.enable = false;
  hardware.cpu.amd.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    #driSupport32Bit = true;

    extraPackages = with pkgs; [
      mesa
      libvdpau-va-gl
      rocmPackages.clr.icd
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
  };

  zramSwap = {
    enable = true;
  };
}
