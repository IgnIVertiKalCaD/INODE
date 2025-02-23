{ config, lib, pkgs, unstablepkgs, ... }:

{
  fonts.packages = with pkgs; [
    source-code-pro
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerdfonts
  ];
}
