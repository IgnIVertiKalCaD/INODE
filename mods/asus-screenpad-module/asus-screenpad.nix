{ lib, pkgs ? import <nixpkgs> { }, kernel }:

let
  linux = kernel.kernel;

  devShell = pkgs.mkShell {
    name = "asus-wmi-screenpad";
    packages = with pkgs; [ pahole ] ++ [ linux ];
    KERNEL_MODULES = "${linux.dev}/lib/modules/${linux.modDirVersion}";
    CPATH = builtins.concatStringsSep ":" [
      "${linux.dev}/lib/modules/${linux.modDirVersion}/source/arch/x86/include/generated"
      "${linux.dev}/lib/modules/${linux.modDirVersion}/source/include"
      "${linux.dev}/lib/modules/${linux.modDirVersion}/build/include"
      "${linux.dev}/lib/modules/${linux.modDirVersion}/build/arch/x86/include/generated"
      "${linux.dev}/lib/modules/${linux.modDirVersion}/source/arch/x86/include/generated/uapi"
      "${linux.dev}/lib/modules/${linux.modDirVersion}/source/include/generated/uapi"
    ];
  };

  defaultPackage = pkgs.stdenv.mkDerivation {
    name = "asus-wmi-screenpad";
    version = "0.1.0";

    hardeningDisable = [ "pic" ];
    nativeBuildInputs = linux.moduleBuildDependencies;

    makeFlags = [
      "KERNEL_MODULES=${linux.dev}/lib/modules/${linux.modDirVersion}"
      "MODULEDIR=$(out)/lib/modules/${linux.version}/kernel/drivers/platform/asus"
    ];

    src = ./.;

    installPhase = ''
      ls 
      mkdir -p $out/lib/modules/${linux.modDirVersion}/kernel/drivers/platform/asus
      cp obj/* $out/lib/modules/${linux.modDirVersion}/kernel/drivers/platform/asus #*/
    '';
  };

  buildWithKernel = pkgs.writeShellScriptBin "buildWithKernel" /* sh */ ''
        kernelPackages="$1"

        if [[ -z "$kernelPackages" ]]; then
          echo >&2 "Kernel Packages argument not supplied!"
          exit 1
        fi
    	ls
        exec nix build --impure --expr "(import <nixpkgs> {}).legacyPackages.${builtins.currentSystem}.$kernelPackages.kernel"
  '';

in
{
  inherit devShell defaultPackage buildWithKernel;
}

