{
  pkgs,
  config,
  desktop,
  ...
}:

{
  imports = [
    ../desktops/shared/home.nix
    (../desktops + "/${desktop}/home")
    ./programs
  ];

  home.username = config.cardetas.username;
  home.homeDirectory = "/home/${config.cardetas.username}";
  home.stateVersion = config.cardetas.stateVersion;

  home.packages = import ./packages.nix { inherit pkgs; };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;
}
