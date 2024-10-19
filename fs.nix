{ config, lib, pkgs, ... }:

{
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  fileSystems."/mnt/a6f2b9d3-1b9b-46b4-ac60-7150c90e48f1" =
    {
      device = "/dev/disk/by-uuid/a6f2b9d3-1b9b-46b4-ac60-7150c90e48f1";

      fsType = "ext4";
    };

  fileSystems."/mnt/dc84c237-143d-4017-94a0-5c8a076d493f" =
    {
      device = "/dev/disk/by-uuid/dc84c237-143d-4017-94a0-5c8a076d493f";
      options = [ "defaults" "x-gvfs-show" ];
      fsType = "ext4";
    };

  fileSystems."/mnt/6106d853-8f55-4d4e-949c-66e19666671c" =
    {
      device = "/dev/disk/by-uuid/6106d853-8f55-4d4e-949c-66e19666671c";
      options = [ "defaults" "x-gvfs-show" ];
      fsType = "ext4";
    };

  fileSystems."/mnt/f450d8ee-cfcd-4d49-af5e-c18cfab65a09" =
    {
      device = "/dev/disk/by-uuid/f450d8ee-cfcd-4d49-af5e-c18cfab65a09";
      options = [ "defaults" "x-gvfs-show" ];
      fsType = "btrfs";
    };
}
