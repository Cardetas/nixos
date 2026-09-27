{ config, pkgs, ... }:

{
  users.users.cardetas = {
    isNormalUser = true;
    description = "";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "bluetooth"
      "libvirtd"
    ];
  };

  programs.zsh.enable = true;
}
