{abs, ...}: {
  imports = let
    moduleNames = builtins.attrNames (builtins.readDir ./modules);
    modulePaths = map (name: ./modules + "/${name}") moduleNames;
  in
    [
      ./hardware-configuration.nix
      (abs "hosts/nixos-common/configuration.nix")
    ]
    ++ modulePaths;
  networking.hostName = "haizara";
  boot.loader.systemd-boot.enable = true;
}
