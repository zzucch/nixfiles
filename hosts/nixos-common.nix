{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    home-manager

    direnv
    nix-direnv

    lazygit

    tree
    scc
    neofetch
    fastfetch

    btop
    htop

    wget
    zip
    unzip
    ffmpeg
    killall
    ripgrep
    brightnessctl
  ];
}
