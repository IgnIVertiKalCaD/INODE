{ config, lib, pkgs, unstablepkgs, ... }:

{
  services.thermald.enable = true;
  services.fwupd.enable = true;

  #  services.tlp = {
  #    enable = true;
  #    settings = {
  #      CPU_SCALING_GOVERNOR_ON_AC = "performance";
  #      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #      CPU_HWP_DYN_BOOST_ON_BAT = 0;
  #      CPU_HWP_DYN_BOOST_ON_AC = 1;
  #
  #      CPU_BOOST_ON_AC = 1;
  #      CPU_BOOST_ON_BAT = 0;
  #
  #      RUNTIME_PM_ON_BAT = "auto";
  #
  #      WIFI_PWR_ON_BAT = "on";
  #
  #      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
  #      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
  #
  #      WOL_DISABLE = "Y";
  #     NMI_WATCHDOG = 0;
  #     PLATFORM_PROFILE_ON_BAT = "low-power";
  #      SOUND_POWER_SAVE_CONTROLLER = "Y";
  #      MEM_SLEEP_ON_BAT = "deep";
  #
  #      CPU_MIN_PERF_ON_AC = 40;
  #      CPU_MAX_PERF_ON_AC = 100;
  #      CPU_MIN_PERF_ON_BAT = 0;
  #      CPU_MAX_PERF_ON_BAT = 60;
  #
  #      #Optional helps save long term battery health
  #      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
  #      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
  #
  #    };
  #  };
}
