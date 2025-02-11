{abs, ...}: {
  imports = [
    (abs "hosts/nixos-common.nix")
    (abs "hosts/server-nixos-common.nix")
  ];
  users.users.zcchr = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "input"
      "wheel"
    ];
  };
  networking.hostName = "kasou";
  services.cloud-init.network.enable = true;
  system.stateVersion = "24.05";
}
