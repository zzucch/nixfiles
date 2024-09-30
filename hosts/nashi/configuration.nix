{abs, ...}: {
  imports = [
    (abs "nixvim/init.nix")
  ];

  system.stateVersion = "24.05";
}
