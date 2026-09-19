{ config, pkgs, ... }:

{
  home.username = "cardetas";
  home.homeDirectory = "/home/cardetas";

  programs.noctalia = {
    enable = true;
  };

  
  xdg.configFile."umbriel/config.toml".source = ./umbriel.toml;

  home.packages = with pkgs; [
    neovim
    firefox   
    kitty
    git
    fastfetch
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
