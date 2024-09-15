{pkgs, ...}: {
  imports = [./nixos-common.nix];
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    home-manager

    direnv
    nix-direnv

    tree
    scc
    tldr
    lazygit
    neofetch
    fastfetch

    btop
    htop

    zip
    unzip

    ffmpeg
    killall
    ripgrep
    nixos-generators
    brightnessctl
  ];
}
