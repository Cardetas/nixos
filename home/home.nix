{
  pkgs,
  config,
  desktop,
  ...
}:

{
  imports = [
    ./umbriel
    ./programs
  ];


  home.username = "cardetas";
  home.homeDirectory = "/home/cardetas";
  home.stateVersion = "26.05";

  home.packages = import ./packages.nix { inherit pkgs; };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;
}
