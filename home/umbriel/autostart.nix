{
  pkgs,
  lib,
  config,
  ...
}:

let
  noctalia = lib.getExe pkgs.noctalia;
in
{
  programs.umbriel.settings.general.autostart = [
    noctalia
  ];
}
