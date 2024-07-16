{pkgs, ...}: {
  imports = [./nixos-common.nix];
  environment.systemPackages = with pkgs; [
    kitty
    tofi
    google-chrome
    telegram-desktop
    obs-studio
    imv
    mpv

    xdg-desktop-portal-hyprland
    xwayland
    wl-clipboard

    hyprland
    hyprcursor
    waybar
    grim
    slurp
    swww

    pipewire
    pavucontrol
  ];
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  ];
}
