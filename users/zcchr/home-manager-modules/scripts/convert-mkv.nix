{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeShellScriptBin "convert-mkv"
      (builtins.readFile ./convert-mkv.sh))
  ];
}
