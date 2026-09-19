{ config, pkgs, ... }:

{
  home.username = "cardetas";
  home.homeDirectory = "/home/cardetas";

  programs.noctalia = {
    enable = true;
    settings = {
      theme.mode = "dark";
    };
  };

  home.packages = with pkgs; [
    firefox
    kitty
    git
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
