{pkgs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.systemPackages = with pkgs; [
    git
    vim

    direnv
    nix-direnv
  ];
}
