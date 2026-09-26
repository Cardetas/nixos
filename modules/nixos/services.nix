{ pkgs, ... }:

{
  security.polkit.enablePkexecWrapper = true;

  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  services.accounts-daemon.enable = true;
  services.gvfs.enable = true;
}
