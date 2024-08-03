{
  config,
  abs,
  pkgs,
  ...
}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  programs.ssh.startAgent = true;
  users.users.zcchr = {
    isNormalUser = true;
    description = "zcchr";
    extraGroups = [
      "networkmanager"
      "input"
      "wheel"
    ];
    openssh.authorizedKeys.keyFiles = [
      (abs "ssh/zcchr-git.pub")
    ];
  };
  security.pam.services.swaylock = {};
  home-manager = let
    username = "zcchr";
  in {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = {
      imports = [
        ./home-manager-modules
      ];
      home = {
        inherit username;
        homeDirectory = "/home/${username}";
        stateVersion = config.system.stateVersion;
      };
    };
  };
}
