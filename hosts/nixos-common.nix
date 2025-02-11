{pkgs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    git
    vim
    gnumake
    tmux

    direnv
    nix-direnv
  ];
}
