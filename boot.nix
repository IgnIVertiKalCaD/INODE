{ config, lib, pkgs, ... }:


{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" "usbhid.mousepoll=1" "amd_pstate=active" "amd_pstate.shared_mem=1" "video=DP-1:3840x2160@60" "video=DP-2:2560x1440@60" ];

  boot.supportedFilesystems = [ "ntfs" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "v4l2loopback" "amdgpu" ];
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ v4l2loopback ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="OBS Virtualcam" exclusive_caps=1
    options amdgpu audio=0
    options snd-hda-intel power_save_controller=false power_save=0 model=auto    
  '';
}
