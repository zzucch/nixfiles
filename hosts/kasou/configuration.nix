{abs, ...}: {
  imports = [
    (abs "hosts/nixos-common.nix")
  ];
  networking.hostName = "kasou";
  services.cloud-init.network.enable = true;
  system.stateVersion = "24.05";
}
