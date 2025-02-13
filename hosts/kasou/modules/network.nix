{
  networking = {
    bridges.vmbr0.interfaces = ["enp7s0"];
    interfaces = {
      vmbr0 = {
        ipv4.addresses = [
          {
            address = "192.168.0.100";
            prefixLength = 24;
          }
        ];
        useDHCP = false;
      };
    };
    defaultGateway = "192.168.0.1";
    nameservers = [
      "192.168.0.1"
    ];
  };
}
