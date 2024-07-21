{pkgs, ...}:
with pkgs; let
  patchDesktop = pkg: appName: from: to: (lib.hiPrio
    (runCommand "$patched-desktop-entry-for-${appName}" {} ''
      ${coreutils}/bin/mkdir -p $out/share/applications
      ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop ''));
in {
  home.packages = [
    spotify
    (patchDesktop
      spotify
      "spotify"
      "^Exec=spotify"
      "Exec=${spotify}/bin/spotify --enable-features=UseOzonePlatform --ozone-platform=wayland")
  ];
}
