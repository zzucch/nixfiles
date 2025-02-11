{pkgs, ...}: {
  services.openssh.enable = true;
  environment.systemPackages = with pkgs; [
    btop
  ];
}
