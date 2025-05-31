{
  virtualisation = {
    docker = {
      enable = false;
    };
    podman = {
      enable = false;
      dockerSocket.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
