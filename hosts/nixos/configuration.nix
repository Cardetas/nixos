# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, desktop, host, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./storage.nix
      ../../modules/cardetas
      ../../modules/nixos
      (../../desktops + "/${desktop}/nixos.nix")
    ];
  


  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
 
  nixpkgs.config.allowUnfree = true;
 
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = [
    pkgs.virt-viewer
  ];

  cardetas = host // {
    cursor = host.cursor // {
      package = pkgs.bibata-cursors;
    };
  };
  networking.hostName = config.cardetas.hostname;
  system.stateVersion = config.cardetas.stateVersion;
}
