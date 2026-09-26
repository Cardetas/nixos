{ config, pkgs, ... }:

{
  users.users.${config.cardetas.username} = {
    isNormalUser = true;
    description = config.cardetas.username;
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "bluetooth"
    ];
  };

  programs.zsh.enable = true;:
}
