{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeShellScriptBin "vpn" (builtins.readFile ./vpn.sh))
  ];
}
