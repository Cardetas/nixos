{ inputs, pkgs, ... }:

{
    imports = [
    inputs.umbriel.nixosModules.default
  ];

  programs.umbriel.enable = true;


   services.displayManager.noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = [ "cardetas" ];
        settings = {
          cursor.size = 24;
          keyboard.layout = "pt";
        };
        cursorTheme = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
        };
      };
  

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  services.xserver = {
    enable = false;
    xkb = {
      layout = "pt";
      variant = "";
    };
  };









}
