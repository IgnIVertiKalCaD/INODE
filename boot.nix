{ config, lib, pkgs, ... }:

let asus-wmi-screenpad-module = import ./mods/asus-screenpad-module/asus-screenpad.nix { lib = pkgs.lib; pkgs = pkgs; kernel = config.boot.kernelPackages; };
in
{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_11;
  boot.kernelParams = [ "video=eDP-1:1920x1080@60" "video=DP-1:1920x515@60" "intel_iommu=on" "iommu=pt" "pcie_aspm=force" "ahci.mobile_lpm_policy=3" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "asus_wmi_screenpad" "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd" ];
  boot.blacklistedKernelModules = [ "bluetooth" "btusb" ];
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ asus-wmi-screenpad-module.defaultPackage ];

  boot.extraModprobeConfig = ''
    options asus-wmi fnlock_default=0

    options i915 enable_guc=3 enable_fbc=1 enable_psr=1 max_vfs=7
    
    options snd_ac97_codec power_save=1
    options snd_hda_intel power_save_controller=1 power_save=1
    
    options iwlmvm power_scheme=3
    options iwlwifi power_save=1
  '';
}
