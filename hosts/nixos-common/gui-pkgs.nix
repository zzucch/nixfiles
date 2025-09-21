{pkgs, ...}: {
  imports = [./desktop-pkgs.nix];
  environment.systemPackages = with pkgs; [
    tofi
    wofi
    google-chrome
    telegram-desktop
    anki-bin
    obs-studio
    qbittorrent
    imv
    mpv

    wl-clipboard

    grim
    slurp
    swww

    pipewire
    pavucontrol
  ];
  hardware.opentabletdriver.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    nerd-fonts.symbols-only
  ];
}
