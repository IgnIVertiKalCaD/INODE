{ config, lib, pkgs, ... }:

{
  programs = {
    steam = { enable = true; };
    dconf = { enable = true; };
    file-roller = { enable = true; };
    fish = { enable = true; };
    gamemode = { enable = true; };

    nix-ld = { 
	enable = true; 
 	libraries = with pkgs; [
      		zlib
      		libgcc
    	];
	 };
};
}
