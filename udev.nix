{ config, lib, pkgs, ... }:

{
  services.udev.extraRules = ''
    SUBSYSTEM=="backlight", ACTION=="add", \
    RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/intel_backlight/brightness",
    RUN+="${pkgs.coreutils}/bin/chmod 760 /sys/class/backlight/intel_backlight/brightness" 
    \
    ACTION=="add", KERNEL=="asus-nb-wmi", RUN+="${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/echo 80 > /sys/class/power_supply/BAT?/charge_control_end_threshold'"
    \
    ACTION=="add", SUBSYSTEM=="leds", KERNEL=="asus::screenpad", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/leds/%k/brightness"
  '';
}
