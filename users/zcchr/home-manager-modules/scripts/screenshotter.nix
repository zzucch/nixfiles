{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeShellScriptBin "screenshotter"
      (builtins.readFile ./screenshotter.sh))
  ];
}
