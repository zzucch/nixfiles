{abs, ...}: {
  imports = let
    moduleNames = builtins.attrNames (builtins.readDir ./modules);
    modulePaths = map (name: ./modules + "/${name}") moduleNames;
  in
    [
      ./hardware-configuration.nix
      (abs "hosts/nixos-common/pkgs.nix")
    ]
    ++ modulePaths;
  services = {
    openssh.enable = true;
    cloud-init.network.enable = true;
  };
  users.users.zcchr = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "input"
      "wheel"
    ];
  };
  networking.hostName = "kasou";
  system.stateVersion = "24.05";
}
