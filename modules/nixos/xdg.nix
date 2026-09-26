{
  pkgs,
  config,
  ...
}:

let
  gtkPortals = [
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk
  ];
in
{
  xdg.portal = {
    enable = true;

    config.common =
        {
          default = "gtk";
        };

    xdgOpenUsePortal = true;

    extraPortals = gtkPortals;
  };
}
