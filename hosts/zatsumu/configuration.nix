{abs, ...}: {
  imports = [
    ./hardware-configuration.nix
    (abs "hosts/nixos-common/configuration.nix")
  ];
  networking.hostName = "zatsumu";
  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };
}
