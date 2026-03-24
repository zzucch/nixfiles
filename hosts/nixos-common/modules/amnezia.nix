{
  pkgs,
  config,
  ...
}: {
  programs.amnezia-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    amneziawg-tools
  ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.amneziawg
  ];
}
