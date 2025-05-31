{abs, ...}: {
  imports = [
    ./hardware-configuration.nix
    (abs "hosts/common/configuration.nix")
  ];
  networking.hostName = "haizara";
}
