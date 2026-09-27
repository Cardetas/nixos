{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

}
