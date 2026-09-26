{ pkgs, ... }:

{
  boot.kernelParams = [ "amdgpu.backlight=0" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPatches = [
    {
      name = "hp-mute-led-quirk";
      patch = ./hp-mute-led.patch;
    }
  ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.limine.enable = true;
  boot.loader.limine.extraEntries = ''
	/Windows
		protocol: efi
		path: uuid(05d09f9f-6b62-41b9-9144-ef47fce9603b):/EFI/Microsoft/Boot/bootmgfw.efi
  '';

}
