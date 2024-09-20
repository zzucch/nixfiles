{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeShellScriptBin "diagnostic"
      (builtins.readFile ./diagnostic.sh))
  ];
}
