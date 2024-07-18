{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    gnumake
    gcc
    go
    nodejs
    rustup
    alejandra

    tmux
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
