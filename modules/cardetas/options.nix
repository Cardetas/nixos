{ lib, ... }:

let
  desktops = import ../../lib/desktops.nix;
in
{
  options.cardetas = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "Primary user account name.";
    };

    hostname = lib.mkOption {
      type = lib.types.str;
      description = "Networking hostname.";
    };

    stateVersion = lib.mkOption {
      type = lib.types.str;
      description = "NixOS / home-manager stateVersion";
    };

    system = lib.mkOption {
      type = lib.types.str;
      description = "Nixpkgs system string";
    };

    desktop = lib.mkOption {
      type = lib.types.enum desktops.names;
      description = "Active compositor / desktop session";
    };

    git = {
      name = lib.mkOption {
        type = lib.types.str;
        description = "Git user.name";
      };

      email = lib.mkOption {
        type = lib.types.str;
        description = "Git user.email";
      };
    };

    cursor ={
    theme = lib.mkOption {
      type = lib.types.str;
      readOnly = true;
      description = "Custom Bibata cursor theme name.";
    };

    package = lib.mkOption {
      type = lib.types.package;
      readOnly = true;
      description = "Declarative fallback cursor package used by the greeter.";
    };
  };
}
