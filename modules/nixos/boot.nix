{ pkgs, ... }:

{
 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.limine.enable = true;
}
