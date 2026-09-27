{ inputs, pkgs, ... }:

{
    imports = [
    inputs.umbriel.nixosModules.default
  ];

  programs.umbriel.enable = true;
  

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
