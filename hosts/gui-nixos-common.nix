{pkgs, ...}: {
  imports = [./desktop-nixos-common.nix];
  environment.systemPackages = with pkgs; [
    tofi
    wofi
    google-chrome
    telegram-desktop
    anki-bin
    obs-studio
    qbittorrent-qt5
    zoom-us
    rnote
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
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];
}
