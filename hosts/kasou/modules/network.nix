{lib, ...}: {
  networking.bridges.vmbr0.interfaces = ["ens18"];
  networking.interfaces.vmbr0.useDHCP = lib.mkDefault true;
}
