{pkgs, ...}: {
  imports = [./nixos-common.nix];
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    home-manager

    tree
    fzf
    scc
    glow
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
    brightnessctl
  ];
}
