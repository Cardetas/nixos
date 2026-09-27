{
  pkgs,
  config,
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
   home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
  
  xdg.configFile."umbriel/config.toml".source = ./umbriel.toml;
  xdg.configFile."noctalia/config.toml".source = ./noctalia.toml;
  
  
  programs.fzf.enable = true;
  programs.btop.enable = true;
  programs.gh.enable = true; 

  home.packages = import ./packages.nix { inherit pkgs; };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  programs.home-manager.enable = true;
}
