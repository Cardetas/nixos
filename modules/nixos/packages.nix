{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    ffmpeg
    vim
    curl
    pciutils
    usbutils
    lsof
    btop
    unzip
  ];
}
