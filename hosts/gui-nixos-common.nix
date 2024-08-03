{pkgs, ...}: {
  imports = [./nixos-common.nix];
  environment.systemPackages = with pkgs; [
    tofi
    wofi
    google-chrome
    telegram-desktop
    anki-bin
    obs-studio
    imv
    mpv

    xdg-desktop-portal-hyprland
    wl-clipboard

    # hyprcursor
    grim
    slurp
    swww

    pipewire
    pavucontrol
  ];
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];
}
