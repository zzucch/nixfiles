{abs, ...}: {
  imports = let
    moduleNames = builtins.attrNames (builtins.readDir ./modules);
    modulePaths = map (name: ./modules + "/${name}") moduleNames;
  in
    [
      ./hardware-configuration.nix
      (abs "hosts/nixos-common.nix")
      (abs "hosts/server-nixos-common.nix")
    ]
    ++ modulePaths;
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
