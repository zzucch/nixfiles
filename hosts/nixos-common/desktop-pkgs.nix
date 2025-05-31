{pkgs, ...}: {
  imports = [./pkgs.nix];
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

    zip
    unzip

    ffmpeg
    killall
    ripgrep
    brightnessctl
  ];
}
