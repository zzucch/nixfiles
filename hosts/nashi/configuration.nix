{abs, ...}: {
  imports = [
    (abs "nixvim/init.nix")
  ];

  nixpkgs.hostPlatform = "x86_64-darwin";
  system.stateVersion = "24.05";
}
