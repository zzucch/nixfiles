{inputs, ...}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    registry = {
      nixpkgs.to = {
        type = "github";
        owner = "NixOS";
        repo = "nixpkgs";
        rev = inputs.nixpkgs.rev;
      };
    };

    useDaemon = true;
    settings.nix-path = ["nixpkgs=flake:nixpkgs"];
  };
  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
}
