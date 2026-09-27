{
  config,
  inputs,
  pkgs,
  ...
}:

{
  systemd.services.nix-daemon.path = [ pkgs.git ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

  nixpkgs.config.allowUnfree = true;

  programs.nh = {
    enable = true;
    flake = "/home/${config.cardetas.username}/nixos";
  };

  programs.nix-ld.enable = true;
}
