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
    {
    formatter = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    
    system = "x86_64-linux";
    
     nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {
          inherit inputs;
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
                  inherit inputs;
                };
                users.cardetas = import ./home/home.nix;
              };
            }
          )
      ];
    };
  };
}
