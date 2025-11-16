{
  abs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    (abs "hosts/nixos-common/configuration.nix")
  ];
  networking.hostName = "zatsumu";
  boot = {
    loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        splashImage = null;
      };
    };
    blacklistedKernelModules = ["rtw88_8821cu"];
    extraModulePackages = with config.boot.kernelPackages; [rtl8821cu];
  };
}
