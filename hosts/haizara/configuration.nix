{abs, ...}: {
  imports = [
    ./hardware-configuration.nix
    (abs "hosts/common/configuration.nix")
  ];
  networking.hostName = "haizara";
  boot.loader.systemd-boot.enable = true;
}
