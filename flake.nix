{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umbriel = {
      url = "github:noctalia-dev/umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    nixpkgs,
    home-manager,
    ... 
    }@inputs:

    let
      host = import ./hosts/nixos/settings.nix;
      inherit (host) desktop system username;
    in
    {
    formatter = nixpkgs.legacyPackages.${system}.alejandra;
    
     nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
    specialArgs = {
          inherit inputs host desktop;
        };

      modules = [
        ./hosts/nixos/configuration.nix
         home-manager.nixosModules.home-manager

          (
            { lib, ... }:
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                overwriteBackup = true;
                extraSpecialArgs = {
                  inherit inputs desktop;
                };
                sharedModules = [
                  ./modules/cardetas
                  { cardetas = host; }
                ];

                users.${username} = import ./home/default.nix;
              };

              systemd.services."home-manager-${username}".serviceConfig.TimeoutStartSec =
                lib.mkForce "30m";
            }
          )
      ];
    };
  };
}
