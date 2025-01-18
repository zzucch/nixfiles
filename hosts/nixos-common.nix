{pkgs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    git
    vim

    direnv
    nix-direnv
  ];
}
