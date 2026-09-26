{
  username = "cardetas";
  hostname = "nixos";
  stateVersion = "26.05";
  system = "x86_64-linux";

  # Active compositor, change here to switch sessions.
  desktop = "umbriel";
  # desktop = "niri";

  git = {
    name = "Cardetas";
    email = "cardetas612@gmail.com";
  };

  cursor = {
       theme = "Bibata-Modern-Ice";
       package = pkgs.bibata-cursors; 
    }
}
