# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  
  # Limine boot loader
  boot.loader.limine.enable = true;
	  # Dual boot windows entry
  boot.loader.limine.extraEntries = ''
	/Windows
		protocol: efi
		path: uuid(05d09f9f-6b62-41b9-9144-ef47fce9603b):/EFI/Microsoft/Boot/bootmgfw.efi
  '';

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  
  networking.networkmanager.enable = true;
  
  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  services.xserver.xkb = {
    layout = "pt";
    variant = "";
  };
  console.keyMap = "pt-latin1";
  
  fileSystems."/shared" = {
    device = "/dev/disk/by-uuid/283B2DFC1E075C02";
    fsType = "ntfs-3g"; 
    options = [ "rw" "uid=1000" "gid=100" "umask=022" ];
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
 

  programs.zsh.enable = true;

  users.users."cardetas" = {
    isNormalUser = true;
    description = "Cardetas";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "libvirtd" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.umbriel.enable = true;

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor.size = 24;
      keyboard.layout = "pt";

    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
  };
  
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
 # services.cockpit = {
 #   enable = true;
 #   port = 9090;
 #   plugins = [
 #     pkgs.cockpit-files
 #     pkgs.cockpit-podman
 #     pkgs.cockpit-machines
 #   ];
 # };

  boot.kernelParams = [ "amdgpu.backlight=0" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelPatches = [
    {
      name = "hp-mute-led-quirk";
      patch = ./hp-mute-led.patch;
    }
  ];

  system.stateVersion = "26.05";
}
