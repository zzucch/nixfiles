{pkgs, ...}: {
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    # configPackages = with pkgs; [xdg-desktop-portal-gtk];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
