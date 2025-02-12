{lib, ...}: {
  networking.bridges.vmbr0.interfaces = ["enp7s0"];
  networking.interfaces.vmbr0.useDHCP = lib.mkDefault true;
}
