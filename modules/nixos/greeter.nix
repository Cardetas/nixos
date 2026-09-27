{
  pkgs,
  config,
  lib,
  inputs,
  desktop,
  ...
}:

let
  desktops = import ../../lib/desktops.nix;
  greeterSession = desktops.greeterSession desktop;
  greeterSettings = {
    greeter_user = "greeter";
    cursor = {
      theme = config.cardetas.cursor.theme;
      size = 24;
    };
    keyboard = {
      layout = "pt";
    };
  };

in
{
      services.displayManager.noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = [ config.cardetas.username ];
        cursorTheme.package = config.cardetas.cursor.package;
        settings = greeterSettings;
      };

}
