{ ... }:

{
  fileSystems."/shared" = {
    device = "/dev/disk/by-uuid/283B2DFC1E075C02";
    fsType = "ntfs-3g"; 
    options = [ "rw" "uid=1000" "gid=100" "umask=022" ];
  };
}
