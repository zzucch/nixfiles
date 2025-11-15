{abs, ...}: {
  imports = [
    ./hardware-configuration.nix
    (abs "hosts/nixos-common/configuration.nix")
  ];
  networking.hostName = "haizara";
  boot.loader.systemd-boot.enable = true;
}
