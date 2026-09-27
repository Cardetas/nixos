# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./storage.nix
      ../../modules/nixos
    ];
  


  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

 boot.kernelParams = [ "amdgpu.backlight=0" ];
  boot.kernelPatches = [
    {
      name = "hp-mute-led-quirk";
      patch = ./hp-mute-led.patch;
    }
  ];

  boot.loader.limine.extraEntries = ''
	/Windows
		protocol: efi
		path: uuid(05d09f9f-6b62-41b9-9144-ef47fce9603b):/EFI/Microsoft/Boot/bootmgfw.efi
  '';
 
  networking.hostName = "nixos";
  system.stateVersion = "26.05";
}
