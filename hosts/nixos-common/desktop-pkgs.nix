{pkgs, ...}: {
  imports = [./pkgs.nix];
  environment.systemPackages = with pkgs; [
    home-manager

    jq
    tree
    fzf
    scc
    glow
    tldr
    lazygit
    fastfetch

    zip
    unzip

    ffmpeg
    killall
    ripgrep
    brightnessctl
  ];
}
