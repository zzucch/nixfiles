{
  virtualisation = {
    docker = {
      enable = true;
    };
    podman = {
      enable = false;
      dockerSocket.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
