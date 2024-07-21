{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    tmux
    direnv
    nix-direnv
    git
    lazygit
    gh
    neofetch
    fastfetch
    wget
    btop
    htop
    zip
    unzip
    ffmpeg
    brightnessctl
    ripgrep
    tree
    scc

    home-manager
  ];
}
