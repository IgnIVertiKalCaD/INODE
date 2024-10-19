{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" "amd_pstate=active" "amd_pstate.shared_mem=1" "video=DP-1:3840x2160@60" "video=DP-2:2560x1440@60" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "v4l2loopback" "amdgpu" ];
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ v4l2loopback ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=10 card_label="OBS Virtualcam" exclusive_caps=1
    options amdgpu audio=0
    options snd-hda-intel power_save_controller=false power_save=0 model=auto 
    
    blacklist snd_hda_codec_generic
  '';
}
