{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeShellScriptBin "smv" (builtins.readFile ./smv.sh))
  ];
}
